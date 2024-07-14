import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:regulatecalories/ui/pages/mainpage_detail.dart';

class DestinationTile extends StatelessWidget {
  final String hari;
  final String waktu;
  final String pelaud; // Tambahkan variabel final string di sini

  const DestinationTile({super.key, required this.hari, required this.waktu, required this.pelaud});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPageDetail(),
          ),
        );
      },
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
              Text(
                pelaud, // Gunakan variabel final string di sini
                style: blackTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
