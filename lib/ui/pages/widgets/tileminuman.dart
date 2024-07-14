import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:regulatecalories/ui/pages/widgets/tile_makanan.dart';

class Tileminuman extends StatelessWidget {
  final String hari;
  final String waktu;
  final String imageUrl;

  const Tileminuman({
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
                    hari: 'Teh Manis',
                    waktu: '104 kalori',
                    imageUrl: 'assets/images/tehmanis.jpeg',
                  ),
                  tilemakanan(
                    hari: 'Air Bening',
                    waktu: '0 Kalori',
                    imageUrl: 'assets/images/airputih.jpg',
                  ),
                  tilemakanan(
                    hari: 'Jus Jeruk',
                    waktu: '53 kalori/100 g',
                    imageUrl: 'assets/images/jusjeruk.jpg',
                  ),
                  tilemakanan(
                    hari: 'Jus Mangga',
                    waktu: '100 kalori',
                    imageUrl: 'assets/images/jusmangga.jpeg',
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
