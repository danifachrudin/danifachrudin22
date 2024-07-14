import 'package:flutter/material.dart';
import 'package:regulatecalories/ui/pages/diet_page.dart';
import 'package:regulatecalories/ui/pages/widgets/button_diet.dart';
import 'package:regulatecalories/ui/pages/widgets/button_settings.dart';
import 'package:regulatecalories/ui/pages/widgets/button_workout.dart';
import '../../shared/theme.dart';

class MainPageDiet extends StatelessWidget {
  const MainPageDiet({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return NotificationListener(
        onNotification: (notification) {
          if (notification is OverscrollIndicatorNotification) {
            // Prevent screen from being pulled down
            notification.disallowIndicator();
          }
          return true;
        },
        child: const DietPage(),
      );
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
      
        child: Container(
          
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 1,
            left: defaultMargin,
            right: defaultMargin,
          ),
          
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonWorkout(),
              ButtonDiet(),
              ButtonSettings(),
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
