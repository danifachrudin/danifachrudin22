import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:regulatecalories/ui/pages/detail_page_atas.dart';
import 'package:regulatecalories/ui/pages/widgets/custom_button.dart';

class TimerWidgetPlateC extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const TimerWidgetPlateC(
      {super.key, required this.lottieurl, required this.namagerakan});

  @override
  _TimerWidgetPlateCState createState() => _TimerWidgetPlateCState();
}

class _TimerWidgetPlateCState extends State<TimerWidgetPlateC> {
  int _start = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          navigateToNextPage(); // Panggil fungsi untuk pindah ke halaman lain
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void navigateToNextPage() {
    // Delay 5 detik sebelum pindah ke halaman lain
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const NextPageCoocons(
            lottieurl: 'assets/images/cocoons.json',
            namagerakan: 'Cocoons',
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              widget.lottieurl,
              width: 300,
              height: 300,
            ),
            Text(
              'Contoh Gerakan',
              style: greentuaTextStyle.copyWith(
                fontSize: 25,
                fontWeight: bold,
              ),
            ),
            Text(
              widget.namagerakan,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: _start / 5,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  ),
                  Text(
                    '$_start',
                    style: const TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman selanjutnya setelah 5 detik
class NextPageCoocons extends StatelessWidget {
  final String lottieurl;
  final String namagerakan;

  const NextPageCoocons(
      {super.key, required this.lottieurl, required this.namagerakan});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            // Menggunakan ukuran responsif dengan MediaQuery
            Container(
              width: 250,
              height: 250, // Menggunakan width untuk responsivitas
              margin: const EdgeInsets.only(bottom: 10),
              child: Lottie.asset(lottieurl),
            ),
            const SizedBox(
              height: 50,
            ),

            Text(
              namagerakan,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Text(
              '5x',
              style: blackTextStyle.copyWith(
                fontSize: 40,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                title: 'Selanjutnya',
                width: 150,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TimerWidgetPlank(
                        lottieurl: 'assets/images/plankleg.json',
                        namagerakan: 'Plank Leg',
                      ),
                    ),
                    (route) => false,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class TimerWidgetPlank extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const TimerWidgetPlank(
      {super.key, required this.lottieurl, required this.namagerakan});

  @override
  _TimerWidgetPlankState createState() => _TimerWidgetPlankState();
}

class _TimerWidgetPlankState extends State<TimerWidgetPlank> {
  int _start = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          navigateToNextPage(); // Panggil fungsi untuk pindah ke halaman lain
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void navigateToNextPage() {
    // Delay 5 detik sebelum pindah ke halaman lain
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const NextPagePl(
            lottieurl: 'assets/images/plankleg.json',
            namagerakan: 'Plank Leg',
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              widget.lottieurl,
              width: 300,
              height: 300,
            ),
            Text(
              'Contoh Gerakan',
              style: greentuaTextStyle.copyWith(
                fontSize: 25,
                fontWeight: bold,
              ),
            ),
            Text(
              widget.namagerakan,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: _start / 5,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  ),
                  Text(
                    '$_start',
                    style: const TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman selanjutnya setelah 5 detik
class NextPagePl extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const NextPagePl({
    super.key,
    required this.lottieurl,
    required this.namagerakan,
  });

  @override
  _NextPagePlState createState() => _NextPagePlState();
}

class _NextPagePlState extends State<NextPagePl> {
  int _timerSeconds = 10;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (mounted) {
          // Periksa apakah widget masih mounted sebelum memanggil setState
          setState(() {
            if (_timerSeconds < 1) {
              timer.cancel();
            } else {
              _timerSeconds = _timerSeconds - 1;
            }
          });
        } else {
          timer.cancel(); // Hentikan timer jika widget sudah tidak mounted
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Container(
              width: 250,
              height: 250,
              margin: const EdgeInsets.only(bottom: 10),
              child: Lottie.asset(widget.lottieurl),
            ),
            const SizedBox(height: 50),
            Text(
              widget.namagerakan,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '00:${_timerSeconds.toString().padLeft(2, '0')}',
              style: blackTextStyle.copyWith(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Selanjutnya',
              width: 150,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimerWidgetPush(
                      lottieurl: 'assets/images/pushup.json',
                      namagerakan: 'Push Up',
                    ),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TimerWidgetPush extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const TimerWidgetPush(
      {super.key, required this.lottieurl, required this.namagerakan});

  @override
  _TimerWidgetPushState createState() => _TimerWidgetPushState();
}

class _TimerWidgetPushState extends State<TimerWidgetPush> {
  int _start = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          navigateToNextPage(); // Panggil fungsi untuk pindah ke halaman lain
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void navigateToNextPage() {
    // Delay 5 detik sebelum pindah ke halaman lain
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const NextPagePush(
            lottieurl: 'assets/images/pushup.json',
            namagerakan: 'Push Up',
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              widget.lottieurl,
              width: 300,
              height: 300,
            ),
            Text(
              'Contoh Gerakan',
              style: greentuaTextStyle.copyWith(
                fontSize: 25,
                fontWeight: bold,
              ),
            ),
            Text(
              widget.namagerakan,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: _start / 5,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  ),
                  Text(
                    '$_start',
                    style: const TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman selanjutnya setelah 5 detik
class NextPagePush extends StatelessWidget {
  final String lottieurl;
  final String namagerakan;

  const NextPagePush(
      {super.key, required this.lottieurl, required this.namagerakan});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            // Menggunakan ukuran responsif dengan MediaQuery
            Container(
              width: 250,
              height: 250, // Menggunakan width untuk responsivitas
              margin: const EdgeInsets.only(bottom: 10),
              child: Lottie.asset(lottieurl),
            ),
            const SizedBox(
              height: 50,
            ),

            Text(
              namagerakan,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Text(
              '10x',
              style: blackTextStyle.copyWith(
                fontSize: 40,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                title: 'Selanjutnya',
                width: 150,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TimerWidgetUp(
                            lottieurl: 'assets/images/upward.json',
                            namagerakan: 'Upward Facing')),
                    (route) => false,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class TimerWidgetUp extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const TimerWidgetUp(
      {super.key, required this.lottieurl, required this.namagerakan});

  @override
  _TimerWidgetUpState createState() => _TimerWidgetUpState();
}

class _TimerWidgetUpState extends State<TimerWidgetUp> {
  int _start = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          navigateToNextPage(); // Panggil fungsi untuk pindah ke halaman lain
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void navigateToNextPage() {
    // Delay 5 detik sebelum pindah ke halaman lain
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const NextPageUp(
            lottieurl: 'assets/images/upward.json',
            namagerakan: 'Upward Facing',
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              widget.lottieurl,
              width: 300,
              height: 300,
            ),
            Text(
              'Contoh Gerakan',
              style: greentuaTextStyle.copyWith(
                fontSize: 25,
                fontWeight: bold,
              ),
            ),
            Text(
              widget.namagerakan,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: _start / 5,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  ),
                  Text(
                    '$_start',
                    style: const TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman selanjutnya setelah 5 detik
class NextPageUp extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const NextPageUp({
    super.key,
    required this.lottieurl,
    required this.namagerakan,
  });

  @override
  _NextPageUpState createState() => _NextPageUpState();
}

class _NextPageUpState extends State<NextPageUp> {
  int _timerSeconds = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (mounted) {
          // Periksa apakah widget masih mounted sebelum memanggil setState
          setState(() {
            if (_timerSeconds < 1) {
              timer.cancel();
            } else {
              _timerSeconds = _timerSeconds - 1;
            }
          });
        } else {
          timer.cancel(); // Hentikan timer jika widget sudah tidak mounted
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Container(
              width: 250,
              height: 250,
              margin: const EdgeInsets.only(bottom: 10),
              child: Lottie.asset(widget.lottieurl),
            ),
            const SizedBox(height: 50),
            Text(
              widget.namagerakan,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '00:${_timerSeconds.toString().padLeft(2, '0')}',
              style: blackTextStyle.copyWith(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Selanjutnya',
              width: 150,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPageAll(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
