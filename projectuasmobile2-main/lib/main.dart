import 'package:flutter/material.dart';
import 'package:regulatecalories/ui/pages/get_started_page.dart';
import 'package:regulatecalories/ui/pages/main_page.dart';
import 'package:regulatecalories/ui/pages/splash_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/get-started': (context) => const GetStartedPage(),
        '/main-page': (context) => const MainPage(),
      },
    );
  }
}
