import 'package:flutter/material.dart';
import 'package:regulatecalories/ui/pages/widgets/custom_button.dart';
import '../../shared/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/getstarted.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10, left: 105,),
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                  fit: BoxFit.cover,
                
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 270,
                  ),
                  Text(
                    '"Diet Anda Adalah Kesehatan anda,\n Pilihan Makanan Yang Baik Adalah Investasi Yang Baik"',
                    style: whiteTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  CustomButton(
                    title: 'Mulai',
                    width: 220,
                    margin: const EdgeInsets.only(top: 90, bottom: 40),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/main-page');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
            
      );
  }
}
