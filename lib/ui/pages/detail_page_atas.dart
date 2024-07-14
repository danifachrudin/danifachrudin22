import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:regulatecalories/ui/pages/widgets/widget_container.dart';
import 'package:regulatecalories/ui/pages/widgets/workout_tile.dart';

class DetailPageAll extends StatelessWidget {
  const DetailPageAll({super.key});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/wopantai.jpg',
            ),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 236),
        height: 214,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            // note Emblem

            // Note
            Container(
              margin: const EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hari 1',
                          style: whiteTextStyle.copyWith(
                            fontSize: 35,
                            fontWeight: bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '10 Menit',
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Semangat',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // NOTE :dESKRIPSI
            const KotakContainer(),
            const WorkoutTile(
              lottieUrl: 'assets/images/jump.json',
              pose: "Jumping Jack",
              repetisi: '10x',
            ),
            const WorkoutTile(
              lottieUrl: 'assets/images/squat.json',
              pose: "Squat",
              repetisi: '5x',
            ),
            const WorkoutTile(
              lottieUrl: 'assets/images/Rplace.json',
              pose: "Running Place",
              repetisi: '30 Detik',
            ),
            const WorkoutTile(
              lottieUrl: 'assets/images/highknee.json',
              pose: "High Knee",
              repetisi: '15 Detik',
            ),
            const WorkoutTile(
              lottieUrl: 'assets/images/lyingleg.json',
              pose: "Lying Leg",
              repetisi: '5x',
            ),
            const WorkoutTile(
              lottieUrl: 'assets/images/situp.json',
              pose: "Sit Up",
              repetisi: '5x',
            ),
            const WorkoutTile(
              lottieUrl: 'assets/images/cocoons.json',
              pose: "Cocoons",
              repetisi: '5x',
            ),
            const WorkoutTile(
              lottieUrl: 'assets/images/plankleg.json',
              pose: "Plank Leg",
              repetisi: '10 Detik',
            ),
            const WorkoutTile(
              lottieUrl: 'assets/images/pushup.json',
              pose: "Push up",
              repetisi: '5x',
            ),
            const WorkoutTile(
              lottieUrl: 'assets/images/upward.json',
              pose: "Upward Facing",
              repetisi: '15 Detik',
            ),
            const SizedBox(height: 40,)
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: NotificationListener(
        onNotification: (overscroll) {
          if (overscroll is OverscrollIndicatorNotification) {
            // Prevent screen from being pulled down
            overscroll.disallowIndicator();
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              backgroundImage(),
              customShadow(),
              content(),
            ],
          ),
        ),
      ),
    );
  }
}
