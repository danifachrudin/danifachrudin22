import 'package:flutter/material.dart';
import 'package:regulatecalories/ui/pages/main_page.dart';

class ButtonSettings extends StatelessWidget {
  final bool isSelected;

  const ButtonSettings({
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
                  'assets/images/settings.png',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
