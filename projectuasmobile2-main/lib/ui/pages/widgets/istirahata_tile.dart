import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';


class IstirahatTile extends StatelessWidget {
  final String hari;
  final String waktu;

  const IstirahatTile({super.key, required this.hari, required this.waktu});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     
      child: Container(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hari,
                      style: greentuaTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: black,
                      ),
                    ),
                    Text(
                      waktu,
                      style: greyTextStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
