import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:regulatecalories/ui/pages/widgets/custom_button.dart';
import 'package:regulatecalories/ui/pages/widgets/widget_ketiga.dart';

class TimerWidgetRplace1 extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const TimerWidgetRplace1(
      {super.key, required this.lottieurl, required this.namagerakan});

  @override
  _TimerWidgetRplace1State createState() => _TimerWidgetRplace1State();
}

class _TimerWidgetRplace1State extends State<TimerWidgetRplace1> {
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
          builder: (BuildContext context) => const NextPage1(
            lottieurl: 'assets/images/highknee.json',
            namagerakan: 'High Knee',
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
class NextPage1 extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const NextPage1({
    super.key,
    required this.lottieurl,
    required this.namagerakan,
  });

  @override
  _NextPage1State createState() => _NextPage1State();
}

class _NextPage1State extends State<NextPage1> {
  int _timerSeconds = 15;

  @override
  void initState() {
    super.initState();
    startTimer1();
  }

  void startTimer1() {
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
                    builder: (context) => const TimerWidgetRplace2(
                      lottieurl: 'assets/images/lyingleg.json',
                      namagerakan: 'Lying Leg',
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

class TimerWidgetRplace2 extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const TimerWidgetRplace2(
      {super.key, required this.lottieurl, required this.namagerakan});

  @override
  _TimerWidgetRplace2State createState() => _TimerWidgetRplace2State();
}

class _TimerWidgetRplace2State extends State<TimerWidgetRplace2> {
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
          builder: (BuildContext context) => const NextPage2(
            lottieurl: 'assets/images/lyingleg.json',
            namagerakan: 'Lying Leg',
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
class NextPage2 extends StatelessWidget {
  final String lottieurl;
  final String namagerakan;

  const NextPage2(
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
                      builder: (context) => const TimerWidgetPlateS(lottieurl: 'assets/images/situp.json',namagerakan: 'Sit Up',),
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

class TimerWidgetPlateS extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const TimerWidgetPlateS(
      {super.key, required this.lottieurl, required this.namagerakan});

  @override
  _TimerWidgetPlateSState createState() => _TimerWidgetPlateSState();
}

class _TimerWidgetPlateSState extends State<TimerWidgetPlateS> {
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
          builder: (BuildContext context) => const NextPageSit(
            lottieurl: 'assets/images/situp.json',
            namagerakan: 'Sit Up',
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
class NextPageSit extends StatelessWidget {
  final String lottieurl;
  final String namagerakan;

  const NextPageSit({super.key, required this.lottieurl, required this.namagerakan});
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
                      builder: (context) => const TimerWidgetPlateC(lottieurl: 'assets/images/cocoons.json',namagerakan: 'Cocoons',),
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
