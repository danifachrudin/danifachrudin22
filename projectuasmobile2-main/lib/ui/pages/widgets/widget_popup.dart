import 'package:flutter/material.dart';


class popup extends StatelessWidget {
  const popup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Navigator Pop-up Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Panggil fungsi untuk menampilkan pop-up navigator
              showPopupNavigator(context);
            },
            child: const Text('Tampilkan Pop-up Navigator'),
          ),
        ),
      ),
    );
  }

  void showPopupNavigator(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Navigasi'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  title: const Text('Menu 1'),
                  onTap: () {
                    // Lakukan aksi ketika menu 1 dipilih
                    Navigator.of(context).pop();
                    // Misalnya:
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Menu1Page()));
                  },
                ),
                ListTile(
                  title: const Text('Menu 2'),
                  onTap: () {
                    // Lakukan aksi ketika menu 2 dipilih
                    Navigator.of(context).pop();
                    // Misalnya:
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Menu2Page()));
                  },
                ),
                // Tambahkan list tile lain sesuai kebutuhan
              ],
            ),
          ),
        );
      },
    );
  }
}
