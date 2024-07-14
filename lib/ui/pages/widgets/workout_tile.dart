import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:regulatecalories/shared/theme.dart';

class WorkoutTile extends StatelessWidget {
  final String lottieUrl;
  final String pose;
  final String repetisi;


  const WorkoutTile({
    super.key,
    required this.lottieUrl,
    required this.pose,
    required this.repetisi,

    
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.only(right: 10),
            child: Lottie.asset(
            lottieUrl, // Ubah dengan path Lottie asset Anda
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pose,
                  style: blackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  repetisi,
                  style: greyTextStyle.copyWith(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
            ],
          ),
        ],
      ),
    );
  }
}
