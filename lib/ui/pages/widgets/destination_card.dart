import 'package:flutter/material.dart';
import 'package:regulatecalories/shared/theme.dart';
import 'package:regulatecalories/ui/pages/mainpage_detail.dart';


class DestinationCard extends StatelessWidget {
  final String name;
  final String city;
  final String imageUrl;
 

  const DestinationCard(
      {super.key,
      required this.name,
      required this.city,
      required this.imageUrl,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> const MainPageDetail(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Container(
              width: 230,
              height: 150,
              margin: const EdgeInsets.only(
                left: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 230,
                    height: 150,
                    margin: const EdgeInsets.only(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          imageUrl,
                        ),
                      ),
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
