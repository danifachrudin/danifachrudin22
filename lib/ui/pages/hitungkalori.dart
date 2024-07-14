import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:regulatecalories/ui/pages/button_plus.dart';
import 'package:regulatecalories/ui/pages/widgets/custom_button.dart';
import 'package:regulatecalories/ui/pages/widgets/tile_buah.dart';
import 'package:regulatecalories/ui/pages/widgets/tile_lottie.dart';
import 'package:regulatecalories/ui/pages/widgets/tile_sayuran.dart';
import 'package:regulatecalories/ui/pages/widgets/tileminuman.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<Contact> contacts = [];
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    _loadContacts(); // Memuat data kontak saat inisialisasi halaman
  }

  @override
  void didUpdateWidget(ContactPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadContacts(); // Memuat data kontak saat halaman diperbarui
  }

  Future<void> _loadContacts() async {
    try {
      List<Contact> loadedContacts = await databaseHelper.getContacts();
      setState(() {
        contacts = loadedContacts;
      });
    } catch (e) {
      // Tangani kesalahan jika ada
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalCalories = _calculateTotalCalories();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hitung Kalori',
          style: blackTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].number),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, index);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Kalori: $totalCalories',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CustomButton(
            title: 'Lihat Kalori Makanan',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const SingleChildScrollView(
                    child: Column(
                      children: [
                        TileLottie(
                          hari: 'Makanan',
                          waktu: '',
                          imageUrl: 'assets/images/foods.json',
                        ),
                        Tileminuman(
                            hari: 'Minuman',
                            waktu: '',
                            imageUrl: 'assets/images/drinks.json'),
                        Tilesayuran(
                          hari: 'Sayuran',
                          waktu: '',
                          imageUrl: 'assets/images/vegetables.json',
                        ),
                        Tilebuah(
                          hari: 'Buah-buahan',
                          waktu: '',
                          imageUrl: 'assets/images/fruits.json',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
        offsetX: 250, // Sesuaikan sesuai kebutuhan
        offsetY: -500, // Sesuaikan sesuai kebutuhan
      ),
      // other Scaffold properties...
    );
  }

  int _calculateTotalCalories() {
    int total = 0;
    for (var contact in contacts) {
      total += int.tryParse(contact.number) ?? 0;
    }
    return total;
  }

  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hitung Kalori'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama Makanan'),
                ),
                TextField(
                  controller: numberController,
                  decoration: const InputDecoration(labelText: 'Jumlah Kalori'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Keluar',
                style: greentuaTextStyle,
              ),
            ),
            TextButton(
              onPressed: () async {
                Contact newContact = Contact(
                  name: nameController.text,
                  number: numberController.text,
                );
                await databaseHelper.insertContact(newContact);
                // Reload contacts after adding
                await _loadContacts();
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Tambahkan',
                style: greentuaTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Item'),
          content:
              const Text('Apakah Anda yakin ingin menghapus Makanan/Minuman ini?'),
          actions: [
            TextButton(
              onPressed: () async {
                int id = contacts[index].id!;
                await databaseHelper.deleteContact(id);
                setState(() {
                  contacts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
          ],
        );
      },
    );
  }
}

class Contact {
  int? id;
  final String name;
  final String number;

  Contact({this.id, required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }
}

class DatabaseHelper {
  static Database? _database;
  static const String dbName = 'contacts.db';
  static const String tableName = 'contacts';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            number TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertContact(Contact contact) async {
    final Database db = await database;
    await db.insert(tableName, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final Database db = await database;
    if (db.isOpen) {
      final List<Map<String, dynamic>> maps = await db.query(tableName);
      return List.generate(maps.length, (index) {
        return Contact(
          id: maps[index]['id'],
          name: maps[index]['name'],
          number: maps[index]['number'],
        );
      });
    } else {
      throw 'Database is closed!';
    }
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class ContactPage2 extends StatefulWidget {
  const ContactPage2({super.key});

  @override
  _ContactPage2State createState() => _ContactPage2State();
}

class _ContactPage2State extends State<ContactPage2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<Contact> contacts = [];
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    _loadContacts(); // Memuat data kontak saat inisialisasi halaman
  }

  @override
  void didUpdateWidget(ContactPage2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadContacts(); // Memuat data kontak saat halaman diperbarui
  }

  Future<void> _loadContacts() async {
    try {
      List<Contact> loadedContacts = await databaseHelper.getContacts();
      setState(() {
        contacts = loadedContacts;
      });
    } catch (e) {
      // Tangani kesalahan jika ada
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalCalories = _calculateTotalCalories();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hitung Kalori',
          style: blackTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].number),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, index);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Kalori: $totalCalories',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CustomButton(
            title: 'Lihat Kalori Makanan',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const SingleChildScrollView(
                    child: Column(
                      children: [
                        TileLottie(
                          hari: 'Makanan',
                          waktu: '',
                          imageUrl: 'assets/images/foods.json',
                        ),
                        Tileminuman(
                            hari: 'Minuman',
                            waktu: '',
                            imageUrl: 'assets/images/drinks.json'),
                        Tilesayuran(
                          hari: 'Sayuran',
                          waktu: '',
                          imageUrl: 'assets/images/vegetables.json',
                        ),
                        Tilebuah(
                          hari: 'Buah-buahan',
                          waktu: '',
                          imageUrl: 'assets/images/fruits.json',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
        offsetX: 250, // Sesuaikan sesuai kebutuhan
        offsetY: -500, // Sesuaikan sesuai kebutuhan
      ),
      // other Scaffold properties...
    );
  }

  int _calculateTotalCalories() {
    int total = 0;
    for (var contact in contacts) {
      total += int.tryParse(contact.number) ?? 0;
    }
    return total;
  }

  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hitung Kalori'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama Makanan'),
                ),
                TextField(
                  controller: numberController,
                  decoration: const InputDecoration(labelText: 'Jumlah Kalori'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Keluar',
                style: greentuaTextStyle,
              ),
            ),
            TextButton(
              onPressed: () async {
                Contact newContact = Contact(
                  name: nameController.text,
                  number: numberController.text,
                );
                await databaseHelper.insertContact(newContact);
                // Reload contacts after adding
                await _loadContacts();
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Tambahkan',
                style: greentuaTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Item'),
          content:
              const Text('Apakah Anda yakin ingin menghapus Makanan/Minuman ini?'),
          actions: [
            TextButton(
              onPressed: () async {
                int id = contacts[index].id!;
                await databaseHelper.deleteContact(id);
                setState(() {
                  contacts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
          ],
        );
      },
    );
  }
}

class Contact2 {
  int? id;
  final String name;
  final String number;

  Contact2({this.id, required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }
}

class DatabaseHelper2 {
  static Database? _database;
  static const String dbName = 'contacts.db';
  static const String tableName = 'contacts';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            number TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertContact(Contact contact) async {
    final Database db = await database;
    await db.insert(tableName, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final Database db = await database;
    if (db.isOpen) {
      final List<Map<String, dynamic>> maps = await db.query(tableName);
      return List.generate(maps.length, (index) {
        return Contact(
          id: maps[index]['id'],
          name: maps[index]['name'],
          number: maps[index]['number'],
        );
      });
    } else {
      throw 'Database is closed!';
    }
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class ContactPage3 extends StatefulWidget {
  const ContactPage3({super.key});

  @override
  _ContactPage3State createState() => _ContactPage3State();
}

class _ContactPage3State extends State<ContactPage3> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<Contact> contacts = [];
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    _loadContacts(); // Memuat data kontak saat inisialisasi halaman
  }

  @override
  void didUpdateWidget(ContactPage3 oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadContacts(); // Memuat data kontak saat halaman diperbarui
  }

  Future<void> _loadContacts() async {
    try {
      List<Contact> loadedContacts = await databaseHelper.getContacts();
      setState(() {
        contacts = loadedContacts;
      });
    } catch (e) {
      // Tangani kesalahan jika ada
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalCalories = _calculateTotalCalories();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hitung Kalori',
          style: blackTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].number),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, index);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Kalori: $totalCalories',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CustomButton(
            title: 'Lihat Kalori Makanan',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const SingleChildScrollView(
                    child: Column(
                      children: [
                        TileLottie(
                          hari: 'Makanan',
                          waktu: '',
                          imageUrl: 'assets/images/foods.json',
                        ),
                        Tileminuman(
                            hari: 'Minuman',
                            waktu: '',
                            imageUrl: 'assets/images/drinks.json'),
                        Tilesayuran(
                          hari: 'Sayuran',
                          waktu: '',
                          imageUrl: 'assets/images/vegetables.json',
                        ),
                        Tilebuah(
                          hari: 'Buah-buahan',
                          waktu: '',
                          imageUrl: 'assets/images/fruits.json',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
        offsetX: 250, // Sesuaikan sesuai kebutuhan
        offsetY: -500, // Sesuaikan sesuai kebutuhan
      ),
      // other Scaffold properties...
    );
  }

  int _calculateTotalCalories() {
    int total = 0;
    for (var contact in contacts) {
      total += int.tryParse(contact.number) ?? 0;
    }
    return total;
  }

  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hitung Kalori'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama Makanan'),
                ),
                TextField(
                  controller: numberController,
                  decoration: const InputDecoration(labelText: 'Jumlah Kalori'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Keluar',
                style: greentuaTextStyle,
              ),
            ),
            TextButton(
              onPressed: () async {
                Contact newContact = Contact(
                  name: nameController.text,
                  number: numberController.text,
                );
                await databaseHelper.insertContact(newContact);
                // Reload contacts after adding
                await _loadContacts();
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Tambahkan',
                style: greentuaTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Item'),
          content:
              const Text('Apakah Anda yakin ingin menghapus Makanan/Minuman ini?'),
          actions: [
            TextButton(
              onPressed: () async {
                int id = contacts[index].id!;
                await databaseHelper.deleteContact(id);
                setState(() {
                  contacts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
          ],
        );
      },
    );
  }
}

class Contact3 {
  int? id;
  final String name;
  final String number;

  Contact3({this.id, required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }
}

class DatabaseHelper3 {
  static Database? _database;
  static const String dbName = 'contacts.db';
  static const String tableName = 'contacts';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            number TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertContact(Contact contact) async {
    final Database db = await database;
    await db.insert(tableName, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final Database db = await database;
    if (db.isOpen) {
      final List<Map<String, dynamic>> maps = await db.query(tableName);
      return List.generate(maps.length, (index) {
        return Contact(
          id: maps[index]['id'],
          name: maps[index]['name'],
          number: maps[index]['number'],
        );
      });
    } else {
      throw 'Database is closed!';
    }
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class ContactPage4 extends StatefulWidget {
  const ContactPage4({super.key});

  @override
  _ContactPage4State createState() => _ContactPage4State();
}

class _ContactPage4State extends State<ContactPage4> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<Contact> contacts = [];
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    _loadContacts(); // Memuat data kontak saat inisialisasi halaman
  }

  @override
  void didUpdateWidget(ContactPage4 oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadContacts(); // Memuat data kontak saat halaman diperbarui
  }

  Future<void> _loadContacts() async {
    try {
      List<Contact> loadedContacts = await databaseHelper.getContacts();
      setState(() {
        contacts = loadedContacts;
      });
    } catch (e) {
      // Tangani kesalahan jika ada
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalCalories = _calculateTotalCalories();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hitung Kalori',
          style: blackTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].number),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, index);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Kalori: $totalCalories',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CustomButton(
            title: 'Lihat Kalori Makanan',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const SingleChildScrollView(
                    child: Column(
                      children: [
                        TileLottie(
                          hari: 'Makanan',
                          waktu: '',
                          imageUrl: 'assets/images/foods.json',
                        ),
                        Tileminuman(
                            hari: 'Minuman',
                            waktu: '',
                            imageUrl: 'assets/images/drinks.json'),
                        Tilesayuran(
                          hari: 'Sayuran',
                          waktu: '',
                          imageUrl: 'assets/images/vegetables.json',
                        ),
                        Tilebuah(
                          hari: 'Buah-buahan',
                          waktu: '',
                          imageUrl: 'assets/images/fruits.json',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
        offsetX: 250, // Sesuaikan sesuai kebutuhan
        offsetY: -500, // Sesuaikan sesuai kebutuhan
      ),
      // other Scaffold properties...
    );
  }

  int _calculateTotalCalories() {
    int total = 0;
    for (var contact in contacts) {
      total += int.tryParse(contact.number) ?? 0;
    }
    return total;
  }

  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hitung Kalori'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama Makanan'),
                ),
                TextField(
                  controller: numberController,
                  decoration: const InputDecoration(labelText: 'Jumlah Kalori'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Keluar',
                style: greentuaTextStyle,
              ),
            ),
            TextButton(
              onPressed: () async {
                Contact newContact = Contact(
                  name: nameController.text,
                  number: numberController.text,
                );
                await databaseHelper.insertContact(newContact);
                // Reload contacts after adding
                await _loadContacts();
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Tambahkan',
                style: greentuaTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Item'),
          content:
              const Text('Apakah Anda yakin ingin menghapus Makanan/Minuman ini?'),
          actions: [
            TextButton(
              onPressed: () async {
                int id = contacts[index].id!;
                await databaseHelper.deleteContact(id);
                setState(() {
                  contacts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
          ],
        );
      },
    );
  }
}

class Contact4 {
  int? id;
  final String name;
  final String number;

  Contact4({this.id, required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }
}

class DatabaseHelper4 {
  static Database? _database;
  static const String dbName = 'contacts.db';
  static const String tableName = 'contacts';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            number TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertContact(Contact contact) async {
    final Database db = await database;
    await db.insert(tableName, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final Database db = await database;
    if (db.isOpen) {
      final List<Map<String, dynamic>> maps = await db.query(tableName);
      return List.generate(maps.length, (index) {
        return Contact(
          id: maps[index]['id'],
          name: maps[index]['name'],
          number: maps[index]['number'],
        );
      });
    } else {
      throw 'Database is closed!';
    }
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class ContactPage5 extends StatefulWidget {
  const ContactPage5({super.key});

  @override
  _ContactPage5State createState() => _ContactPage5State();
}

class _ContactPage5State extends State<ContactPage5> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<Contact> contacts = [];
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    _loadContacts(); // Memuat data kontak saat inisialisasi halaman
  }

  @override
  void didUpdateWidget(ContactPage5 oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadContacts(); // Memuat data kontak saat halaman diperbarui
  }

  Future<void> _loadContacts() async {
    try {
      List<Contact> loadedContacts = await databaseHelper.getContacts();
      setState(() {
        contacts = loadedContacts;
      });
    } catch (e) {
      // Tangani kesalahan jika ada
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalCalories = _calculateTotalCalories();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hitung Kalori',
          style: blackTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].number),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, index);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Kalori: $totalCalories',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CustomButton(
            title: 'Lihat Kalori Makanan',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const SingleChildScrollView(
                    child: Column(
                      children: [
                        TileLottie(
                          hari: 'Makanan',
                          waktu: '',
                          imageUrl: 'assets/images/foods.json',
                        ),
                        Tileminuman(
                            hari: 'Minuman',
                            waktu: '',
                            imageUrl: 'assets/images/drinks.json'),
                        Tilesayuran(
                          hari: 'Sayuran',
                          waktu: '',
                          imageUrl: 'assets/images/vegetables.json',
                        ),
                        Tilebuah(
                          hari: 'Buah-buahan',
                          waktu: '',
                          imageUrl: 'assets/images/fruits.json',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
        offsetX: 250, // Sesuaikan sesuai kebutuhan
        offsetY: -500, // Sesuaikan sesuai kebutuhan
      ),
      // other Scaffold properties...
    );
  }

  int _calculateTotalCalories() {
    int total = 0;
    for (var contact in contacts) {
      total += int.tryParse(contact.number) ?? 0;
    }
    return total;
  }

  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hitung Kalori'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama Makanan'),
                ),
                TextField(
                  controller: numberController,
                  decoration: const InputDecoration(labelText: 'Jumlah Kalori'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Keluar',
                style: greentuaTextStyle,
              ),
            ),
            TextButton(
              onPressed: () async {
                Contact newContact = Contact(
                  name: nameController.text,
                  number: numberController.text,
                );
                await databaseHelper.insertContact(newContact);
                // Reload contacts after adding
                await _loadContacts();
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Tambahkan',
                style: greentuaTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Item'),
          content:
              const Text('Apakah Anda yakin ingin menghapus Makanan/Minuman ini?'),
          actions: [
            TextButton(
              onPressed: () async {
                int id = contacts[index].id!;
                await databaseHelper.deleteContact(id);
                setState(() {
                  contacts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
          ],
        );
      },
    );
  }
}

class Contact5 {
  int? id;
  final String name;
  final String number;

  Contact5({this.id, required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }
}

class DatabaseHelper5 {
  static Database? _database;
  static const String dbName = 'contacts.db';
  static const String tableName = 'contacts';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            number TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertContact(Contact contact) async {
    final Database db = await database;
    await db.insert(tableName, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final Database db = await database;
    if (db.isOpen) {
      final List<Map<String, dynamic>> maps = await db.query(tableName);
      return List.generate(maps.length, (index) {
        return Contact(
          id: maps[index]['id'],
          name: maps[index]['name'],
          number: maps[index]['number'],
        );
      });
    } else {
      throw 'Database is closed!';
    }
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class ContactPage6 extends StatefulWidget {
  const ContactPage6({super.key});

  @override
  _ContactPage6State createState() => _ContactPage6State();
}

class _ContactPage6State extends State<ContactPage6> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<Contact> contacts = [];
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    _loadContacts(); // Memuat data kontak saat inisialisasi halaman
  }

  @override
  void didUpdateWidget(ContactPage6 oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadContacts(); // Memuat data kontak saat halaman diperbarui
  }

  Future<void> _loadContacts() async {
    try {
      List<Contact> loadedContacts = await databaseHelper.getContacts();
      setState(() {
        contacts = loadedContacts;
      });
    } catch (e) {
      // Tangani kesalahan jika ada
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalCalories = _calculateTotalCalories();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hitung Kalori',
          style: blackTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].number),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, index);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Kalori: $totalCalories',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CustomButton(
            title: 'Lihat Kalori Makanan',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const SingleChildScrollView(
                    child: Column(
                      children: [
                        TileLottie(
                          hari: 'Makanan',
                          waktu: '',
                          imageUrl: 'assets/images/foods.json',
                        ),
                        Tileminuman(
                            hari: 'Minuman',
                            waktu: '',
                            imageUrl: 'assets/images/drinks.json'),
                        Tilesayuran(
                          hari: 'Sayuran',
                          waktu: '',
                          imageUrl: 'assets/images/vegetables.json',
                        ),
                        Tilebuah(
                          hari: 'Buah-buahan',
                          waktu: '',
                          imageUrl: 'assets/images/fruits.json',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
        offsetX: 250, // Sesuaikan sesuai kebutuhan
        offsetY: -500, // Sesuaikan sesuai kebutuhan
      ),
      // other Scaffold properties...
    );
  }

  int _calculateTotalCalories() {
    int total = 0;
    for (var contact in contacts) {
      total += int.tryParse(contact.number) ?? 0;
    }
    return total;
  }

  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hitung Kalori'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama Makanan'),
                ),
                TextField(
                  controller: numberController,
                  decoration: const InputDecoration(labelText: 'Jumlah Kalori'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Keluar',
                style: greentuaTextStyle,
              ),
            ),
            TextButton(
              onPressed: () async {
                Contact newContact = Contact(
                  name: nameController.text,
                  number: numberController.text,
                );
                await databaseHelper.insertContact(newContact);
                // Reload contacts after adding
                await _loadContacts();
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Tambahkan',
                style: greentuaTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Item'),
          content:
              const Text('Apakah Anda yakin ingin menghapus Makanan/Minuman ini?'),
          actions: [
            TextButton(
              onPressed: () async {
                int id = contacts[index].id!;
                await databaseHelper.deleteContact(id);
                setState(() {
                  contacts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
          ],
        );
      },
    );
  }
}

class Contact6 {
  int? id;
  final String name;
  final String number;

  Contact6({this.id, required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }
}

class DatabaseHelper6 {
  static Database? _database;
  static const String dbName = 'contacts.db';
  static const String tableName = 'contacts';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            number TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertContact(Contact contact) async {
    final Database db = await database;
    await db.insert(tableName, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final Database db = await database;
    if (db.isOpen) {
      final List<Map<String, dynamic>> maps = await db.query(tableName);
      return List.generate(maps.length, (index) {
        return Contact(
          id: maps[index]['id'],
          name: maps[index]['name'],
          number: maps[index]['number'],
        );
      });
    } else {
      throw 'Database is closed!';
    }
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class ContactPage7 extends StatefulWidget {
  const ContactPage7({super.key});

  @override
  _ContactPage7State createState() => _ContactPage7State();
}

class _ContactPage7State extends State<ContactPage7> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<Contact> contacts = [];
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    _loadContacts(); // Memuat data kontak saat inisialisasi halaman
  }

  @override
  void didUpdateWidget(ContactPage7 oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadContacts(); // Memuat data kontak saat halaman diperbarui
  }

  Future<void> _loadContacts() async {
    try {
      List<Contact> loadedContacts = await databaseHelper.getContacts();
      setState(() {
        contacts = loadedContacts;
      });
    } catch (e) {
      // Tangani kesalahan jika ada
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalCalories = _calculateTotalCalories();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hitung Kalori',
          style: blackTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].number),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, index);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Kalori: $totalCalories',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CustomButton(
            title: 'Lihat Kalori Makanan',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const SingleChildScrollView(
                    child: Column(
                      children: [
                        TileLottie(
                          hari: 'Makanan',
                          waktu: '',
                          imageUrl: 'assets/images/foods.json',
                        ),
                        Tileminuman(
                            hari: 'Minuman',
                            waktu: '',
                            imageUrl: 'assets/images/drinks.json'),
                        Tilesayuran(
                          hari: 'Sayuran',
                          waktu: '',
                          imageUrl: 'assets/images/vegetables.json',
                        ),
                        Tilebuah(
                          hari: 'Buah-buahan',
                          waktu: '',
                          imageUrl: 'assets/images/fruits.json',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
        offsetX: 250, // Sesuaikan sesuai kebutuhan
        offsetY: -500, // Sesuaikan sesuai kebutuhan
      ),
      // other Scaffold properties...
    );
  }

  int _calculateTotalCalories() {
    int total = 0;
    for (var contact in contacts) {
      total += int.tryParse(contact.number) ?? 0;
    }
    return total;
  }

  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hitung Kalori'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama Makanan'),
                ),
                TextField(
                  controller: numberController,
                  decoration: const InputDecoration(labelText: 'Jumlah Kalori'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Keluar',
                style: greentuaTextStyle,
              ),
            ),
            TextButton(
              onPressed: () async {
                Contact newContact = Contact(
                  name: nameController.text,
                  number: numberController.text,
                );
                await databaseHelper.insertContact(newContact);
                // Reload contacts after adding
                await _loadContacts();
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Tambahkan',
                style: greentuaTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Item'),
          content:
              const Text('Apakah Anda yakin ingin menghapus Makanan/Minuman ini?'),
          actions: [
            TextButton(
              onPressed: () async {
                int id = contacts[index].id!;
                await databaseHelper.deleteContact(id);
                setState(() {
                  contacts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
          ],
        );
      },
    );
  }
}

class Contact7 {
  int? id;
  final String name;
  final String number;

  Contact7({this.id, required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }
}

class DatabaseHelper7 {
  static Database? _database;
  static const String dbName = 'contacts.db';
  static const String tableName = 'contacts';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            number TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertContact(Contact contact) async {
    final Database db = await database;
    await db.insert(tableName, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final Database db = await database;
    if (db.isOpen) {
      final List<Map<String, dynamic>> maps = await db.query(tableName);
      return List.generate(maps.length, (index) {
        return Contact(
          id: maps[index]['id'],
          name: maps[index]['name'],
          number: maps[index]['number'],
        );
      });
    } else {
      throw 'Database is closed!';
    }
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class ContactPage8 extends StatefulWidget {
  const ContactPage8({super.key});

  @override
  _ContactPage8State createState() => _ContactPage8State();
}

class _ContactPage8State extends State<ContactPage8> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<Contact> contacts = [];
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    _loadContacts(); // Memuat data kontak saat inisialisasi halaman
  }

  @override
  void didUpdateWidget(ContactPage8 oldWidget) {
    super.didUpdateWidget(oldWidget);
    _loadContacts(); // Memuat data kontak saat halaman diperbarui
  }

  Future<void> _loadContacts() async {
    try {
      List<Contact> loadedContacts = await databaseHelper.getContacts();
      setState(() {
        contacts = loadedContacts;
      });
    } catch (e) {
      // Tangani kesalahan jika ada
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalCalories = _calculateTotalCalories();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hitung Kalori',
          style: blackTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].number),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmationDialog(context, index);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Kalori: $totalCalories',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CustomButton(
            title: 'Lihat Kalori Makanan',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const SingleChildScrollView(
                    child: Column(
                      children: [
                        TileLottie(
                          hari: 'Makanan',
                          waktu: '',
                          imageUrl: 'assets/images/foods.json',
                        ),
                        Tileminuman(
                            hari: 'Minuman',
                            waktu: '',
                            imageUrl: 'assets/images/drinks.json'),
                        Tilesayuran(
                          hari: 'Sayuran',
                          waktu: '',
                          imageUrl: 'assets/images/vegetables.json',
                        ),
                        Tilebuah(
                          hari: 'Buah-buahan',
                          waktu: '',
                          imageUrl: 'assets/images/fruits.json',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
        offsetX: 250, // Sesuaikan sesuai kebutuhan
        offsetY: -500, // Sesuaikan sesuai kebutuhan
      ),
      // other Scaffold properties...
    );
  }

  int _calculateTotalCalories() {
    int total = 0;
    for (var contact in contacts) {
      total += int.tryParse(contact.number) ?? 0;
    }
    return total;
  }

  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hitung Kalori'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama Makanan'),
                ),
                TextField(
                  controller: numberController,
                  decoration: const InputDecoration(labelText: 'Jumlah Kalori'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Keluar',
                style: greentuaTextStyle,
              ),
            ),
            TextButton(
              onPressed: () async {
                Contact newContact = Contact(
                  name: nameController.text,
                  number: numberController.text,
                );
                await databaseHelper.insertContact(newContact);
                // Reload contacts after adding
                await _loadContacts();
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Tambahkan',
                style: greentuaTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Item'),
          content:
              const Text('Apakah Anda yakin ingin menghapus Makanan/Minuman ini?'),
          actions: [
            TextButton(
              onPressed: () async {
                int id = contacts[index].id!;
                await databaseHelper.deleteContact(id);
                setState(() {
                  contacts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
          ],
        );
      },
    );
  }
}

class Contact8 {
  int? id;
  final String name;
  final String number;

  Contact8({this.id, required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }
}

class DatabaseHelper8 {
  static Database? _database;
  static const String dbName = 'contacts.db';
  static const String tableName = 'contacts';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            number TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> insertContact(Contact contact) async {
    final Database db = await database;
    await db.insert(tableName, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final Database db = await database;
    if (db.isOpen) {
      final List<Map<String, dynamic>> maps = await db.query(tableName);
      return List.generate(maps.length, (index) {
        return Contact(
          id: maps[index]['id'],
          name: maps[index]['name'],
          number: maps[index]['number'],
        );
      });
    } else {
      throw 'Database is closed!';
    }
  }

  Future<void> deleteContact(int id) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
