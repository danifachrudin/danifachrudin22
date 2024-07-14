import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:regulatecalories/ui/pages/widgets/custom_button.dart';
import 'package:regulatecalories/ui/pages/widgets/widget_start.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
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
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const NextPage()),
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
              'assets/images/jump.json',
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
              'Jumping Jack',
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
  const NextPage({super.key});

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
              child: Lottie.asset('assets/images/jump.json'),
            ),
            const SizedBox(
              height: 50,
            ),

            Text(
              'Jumping Jack',
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
                      builder: (context) => const TimerWidgetPlate(lottieurl: 'assets/images/squat.json',namagerakan: 'Squat', ),
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

