import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:regulatecalories/ui/pages/widgets/tile_makanan.dart';

class TileLottie extends StatelessWidget {
  final String hari;
  final String waktu;
  final String imageUrl;

  const TileLottie({
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
                    hari: '1 Buah Telur Rebus',
                    waktu: '155,1 kalori',
                    imageUrl: 'assets/images/telor.png',
                  ),
                  tilemakanan(
                    hari: 'Nasi 100 gram',
                    waktu: '130 Kalori',
                    imageUrl: 'assets/images/nasi.png',
                  ),
                  tilemakanan(
                    hari: 'Nasi Merah',
                    waktu: '122 kalori',
                    imageUrl: 'assets/images/nasimerah.jpg',
                  ),
                  tilemakanan(
                    hari: 'Geprek',
                    waktu: '263 kalori',
                    imageUrl: 'assets/images/geprek.jpg',
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
