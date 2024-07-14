import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:regulatecalories/ui/pages/widgets/tile_makanan.dart';

class Tilebuah extends StatelessWidget {
  final String hari;
  final String waktu;
  final String imageUrl;

  const Tilebuah({
    super.key,
    required this.hari,
    required this.waktu,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Menutup modal bottom sheet yang lama
        Navigator.pop(context);

        // Menampilkan modal bottom sheet baru
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return const SingleChildScrollView(
              child: Column(
                children: [
                  tilemakanan(
                    hari: 'Jeruk',
                    waktu: '47,1 kalori/100 g',
                    imageUrl: 'assets/images/jeruk.jpeg',
                  ),
                  tilemakanan(
                    hari: 'Apel',
                    waktu: '52.1 Kalori/100 g',
                    imageUrl: 'assets/images/apel.jpg',
                  ),
                  tilemakanan(
                    hari: 'Pisang',
                    waktu: '88.7 kalori/100 g',
                    imageUrl: 'assets/images/pisang.jpeg',
                  ),
                  tilemakanan(
                    hari: 'Semangka',
                    waktu: '30.4 kalori/100 g',
                    imageUrl: 'assets/images/semangka.png',
                  ),
                ],
              ),
            );
          },
        );
      },
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
              ),
              child: Lottie.asset(imageUrl),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hari,
                    style: blackTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight
                          .w500, // Mengubah medium menjadi FontWeight.w500
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
