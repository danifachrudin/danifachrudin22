import 'package:flutter/material.dart';
import 'package:regulatecalories/ui/pages/main_page.dart';

class ButtonWorkout extends StatelessWidget {
  final bool isSelected;

  const ButtonWorkout({
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const MainPage()));
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/situp.png',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
