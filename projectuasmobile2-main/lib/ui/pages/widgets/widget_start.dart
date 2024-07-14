import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:regulatecalories/ui/pages/widgets/custom_button.dart';
import 'package:regulatecalories/ui/pages/widgets/widget_kedua_start.dart';

class TimerWidgetPlate extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const TimerWidgetPlate(
      {super.key, required this.lottieurl, required this.namagerakan});

  @override
  _TimerWidgetPlateState createState() => _TimerWidgetPlateState();
}

class _TimerWidgetPlateState extends State<TimerWidgetPlate> {
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
          builder: (BuildContext context) => const NextPage(
            lottieurl: 'assets/images/squat.json',
            namagerakan: 'Squat',
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
class NextPage extends StatelessWidget {
  final String lottieurl;
  final String namagerakan;

  const NextPage({super.key, required this.lottieurl, required this.namagerakan});
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
                      builder: (context) => const TimerWidgetRplace(
                          lottieurl: 'assets/images/Rplace.json',
                          namagerakan: 'Running Place'),
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

class TimerWidgetRplace extends StatefulWidget {
  final String lottieurl;
  final String namagerakan;

  const TimerWidgetRplace(
      {super.key, required this.lottieurl, required this.namagerakan});

  @override
  _TimerWidgetRplaceState createState() => _TimerWidgetRplaceState();
}

class _TimerWidgetRplaceState extends State<TimerWidgetRplace> {
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
            lottieurl: 'assets/images/Rplace.json',
            namagerakan: 'Running Place',
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
      if (mounted) { // Periksa apakah widget masih mounted sebelum memanggil setState
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
                    builder: (context) => const TimerWidgetRplace1(
                      lottieurl: 'assets/images/highknee.json',
                      namagerakan: 'High Knee',
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
