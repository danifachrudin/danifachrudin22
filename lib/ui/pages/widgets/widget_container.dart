import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';

class KotakContainer extends StatelessWidget {
  const KotakContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'Olahraga kardio adalah aktivitas fisik yang bertujuan untuk memompa darah dari jantung dan paru-paru supaya detak jantung meningkat hingga mencapai titik maksimal pembakaran lemak dan kalori. Bisa dikatakan bahwa olahraga kardio adalah olahraga yang baik bagi jantung.',
            style: blackTextStyle.copyWith(
              fontSize: 13,
              fontWeight: regular,
              height: 2.2,
            ),
          ),
        ],
      ),
    );
  }
}
