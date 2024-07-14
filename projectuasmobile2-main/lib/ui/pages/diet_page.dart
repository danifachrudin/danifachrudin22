import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:regulatecalories/ui/pages/hitungkalori.dart';
import 'package:regulatecalories/ui/pages/widgets/destination_card.dart';
import 'package:regulatecalories/ui/pages/widgets/seat_item.dart';

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hai,\nAnas Adnan',
                    style: greentuaTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Selesaikan apa yang sudah dimulai?',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget popularDestinations() {
      return Container(
        margin: const EdgeInsets.only(top: 5),
        child: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DestinationCard(
                name: 'Lake Ciliwung',
                city: 'Tangerang',
                imageUrl: 'assets/images/wopantai.jpg',
              ),
              DestinationCard(
                name: 'White House',
                city: 'Spain',
                imageUrl: 'assets/images/wo2.jpg',
              ),
              DestinationCard(
                name: 'Hill Heyo',
                city: 'Monaco',
                imageUrl: 'assets/images/wo3.jpg',
              ),
              DestinationCard(
                name: 'Menarra',
                city: 'Jepang',
                imageUrl: 'assets/images/wo4.jpg',
              ),
            ],
          ),
        ),
      );
    }

    Widget teksQuote() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
          left: 20,
        ),
        child: Text(
          'Hitung kalorimu \nuntuk evaluasi diri kamu',
          style: greentuaTextStyle.copyWith(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
      );
    }

    Widget selectSeat() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Column(
          children: [
            // Note Seat Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      SeatItem(
                        hari:
                            'Hari 1', // Tambahkan tanda $ di depan totalCalories
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContactPage()),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SeatItem(
                        hari:
                            'Hari 2', // Tambahkan tanda $ di depan totalCalories
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContactPage2()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 3', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 4', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 5', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 6', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 7', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 8', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 9', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 10', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 11', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 12', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 13', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 14', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 15', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 16', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 17', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 18', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 19', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 20', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 21', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 22', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 23', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 24', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 25', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 26', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 27', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 28', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeatItem(
                    hari: 'Hari 29', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  SeatItem(
                    hari: 'Hari 30', // Tambahkan tanda $ di depan totalCalories
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ContactPage2()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: ListView(
          children: [
            header(),
            popularDestinations(),
            teksQuote(),
            selectSeat(),
          ],
        ),
      ),
    );
  }
}
