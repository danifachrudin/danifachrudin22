import 'package:flutter/material.dart';
import 'package:regulatecalories/ui/pages/main_page_diet.dart';
import '../../../shared/theme.dart';

class ButtonDiet extends StatelessWidget {
  final bool isSelected;
  const ButtonDiet({
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainPageDiet()));
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/sendok.png',
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
            color: isSelected ? kGreenColor : kTransparentColor,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ],
    );
  }
}
