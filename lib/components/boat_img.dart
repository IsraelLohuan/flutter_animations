import 'package:flutter/material.dart';
import 'package:flutter_boats_challenge/models/boat.dart';

class BoatImg extends StatelessWidget {

  final Boat boat;

  BoatImg(this.boat);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Positioned(
      right: 40,
      child: Hero(
        tag: boat.text,
        child: Transform.rotate(
          angle: 3 * 3.1416 / 2,
          child: Image.asset(
            boat.img,
            height: size.width,
          ),
        ),
        flightShuttleBuilder: (
          BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext,
        ) {
          final Hero toHero = fromHeroContext.widget;
          final Hero fromHero = fromHeroContext.widget;

          return RotationTransition(
            turns: flightDirection == HeroFlightDirection.push
                ? animation.drive(Tween(begin: 0.0, end: -.25))
                : animation.drive(Tween(begin: .25, end: 0)),
            child: flightDirection == HeroFlightDirection.push
                ? toHero.child
                : fromHero.child,
          );
        },
      ),
    );
  }
}
