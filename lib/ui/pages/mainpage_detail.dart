import 'package:flutter/material.dart';
import 'package:regulatecalories/ui/pages/detail_page_atas.dart';
import 'package:regulatecalories/ui/pages/main_page.dart';
import 'package:regulatecalories/ui/pages/timer.dart';

import 'package:regulatecalories/ui/pages/widgets/custom_button.dart';
import '../../shared/theme.dart';

class MainPageDetail extends StatelessWidget {
  const MainPageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return const DetailPageAll();
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 5,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                title: 'Selesai',
                width: 120,
                onPressed: () {
                  // Navigate to the next page and prevent going back
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
              ),
              CustomButton(
                title: 'Mulai',
                width: 120,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const TimerWidget()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          buildContent(),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
