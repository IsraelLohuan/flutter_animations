
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boats_challenge/components/boat_close_btn.dart';
import 'package:flutter_boats_challenge/components/boat_img.dart';
import 'package:flutter_boats_challenge/components/full_spec.dart';
import 'package:flutter_boats_challenge/models/boat.dart';

class BoatDetails extends StatelessWidget {
  const BoatDetails({Key key, @required this.boat}) : super(key: key);

  final Boat boat;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          FullSpec(size: size, boat: boat),
          buildShadow(size),
          BoatImg(boat),
          BoatCloseBtn(),
        ],
      ),
    );
  }

  Widget buildShadow(Size size) {
    return Hero(
      tag: 'bg',
          child: Container(
        height: size.width - 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [.3, .75, 1.0],
            colors: [
              Colors.blue,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}