import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:regulatecalories/ui/pages/widgets/destination_card.dart';
import 'package:regulatecalories/ui/pages/widgets/destination_tile.dart';
import 'package:regulatecalories/ui/pages/widgets/istirahata_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

    Widget newDestinations() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Luangkan Waktu Dan Tetap Fokus',
              style: greentuaTextStyle.copyWith(
                fontSize: 18,
                fontWeight: regular,
              ),
            ),
            const DestinationTile(
              hari: 'Hari 1',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 2',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 3',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 4',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 5',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 6',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const IstirahatTile(hari: 'Hari 7', waktu: 'Istirahat'),
            const DestinationTile(
              hari: 'Hari 8',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 9',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 10',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 11',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 12',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 13',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const IstirahatTile(
              hari: 'Hari 14',
              waktu: 'Istirahat',
            ),
            const DestinationTile(
              hari: 'Hari 15',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 16',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 17',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 18',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 19',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 20',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const IstirahatTile(hari: 'Hari 21', waktu: 'Istirahat'),
            const DestinationTile(
              hari: 'Hari 22',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 23',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 24',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 25',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 26',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 27',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const IstirahatTile(hari: 'Hari 28', waktu: 'Istirahat'),
            const DestinationTile(
              hari: 'Hari 29',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
            const DestinationTile(
              hari: 'Hari 30',
              waktu: '10 Menit',
              pelaud: '0%',
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        popularDestinations(),
        newDestinations(),
      ],
    );
  }
}
