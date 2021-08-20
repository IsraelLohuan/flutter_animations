
import 'package:flutter/material.dart';
import 'package:flutter_boats_challenge/components/boat_details.dart';
import 'package:flutter_boats_challenge/models/boat.dart';

class BoatCard extends StatelessWidget {
  const BoatCard({
    Key key,
    @required this.boat,
  }) : super(key: key);

  final Boat boat;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: boat.text,
          child: Image.asset(
            boat.img,
            height: size.height * .6,
          ),
        ),
        Text(
          boat.text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text('By ${boat.text2}'),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return BoatDetails(
                    boat: boat,
                  );
                },
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SPEC"),
              Icon(Icons.chevron_right_outlined),
            ],
          ),
        )
      ],
    );
  }
}