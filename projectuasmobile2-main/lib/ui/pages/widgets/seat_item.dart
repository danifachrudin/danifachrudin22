import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';

class SeatItem extends StatelessWidget {
  final String hari;
  final VoidCallback? onPressed;

  const SeatItem({
    super.key,
    required this.hari,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          color: kGreenTuaColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: kWhiteColor,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          hari,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
