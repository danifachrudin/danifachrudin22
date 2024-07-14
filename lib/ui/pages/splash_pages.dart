import 'dart:async';

import 'package:flutter/material.dart';
import 'package:regulatecalories/ui/pages/get_started_page.dart';

import '../../shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Menunggu 4 detik sebelum berpindah ke halaman 'get-started'
    Timer(const Duration(seconds: 3), () {
      // Memastikan bahwa context tidak null dan menggunakan Navigator
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const GetStartedPage()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenTuaColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menggunakan ukuran responsif dengan MediaQuery
            Container(
              width: 500,
              height:500,  // Menggunakan width untuk responsivitas
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
