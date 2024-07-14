import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';

class tilemakanan extends StatelessWidget {
  final String hari;
  final String waktu;
  final String imageUrl;

  const tilemakanan(
      {super.key,
      required this.hari,
      required this.waktu,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.grey[200],
                image: DecorationImage(
                  image: AssetImage(
                    imageUrl,
                  ),
                ), // Warna latar belakang sementara animasi dimuat
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hari,
                    style: blackTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
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
    );
  }
}
