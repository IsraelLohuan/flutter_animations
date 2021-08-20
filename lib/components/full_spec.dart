
import 'package:flutter/material.dart';
import 'package:flutter_boats_challenge/app_const.dart';
import 'package:flutter_boats_challenge/components/boat_spec.dart';
import 'package:flutter_boats_challenge/components/gallery.dart';
import 'package:flutter_boats_challenge/main.dart';
import 'package:flutter_boats_challenge/models/boat.dart';

class FullSpec extends StatelessWidget {
  const FullSpec({
    Key key,
    @required this.size,
    @required this.boat,
  }) : super(key: key);

  final Size size;
  final Boat boat;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppConst.padding),
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 1000),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (_, value, __) {
            final trans = Curves.elasticOut.transform(value);
            return Transform(
              transform: Matrix4.identity()..scale(1.0, trans),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.width - 70,
                  ),
                  Text(
                    boat.text,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    'By ${boat.text2}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppConst.padding * 2,
                    ),
                    child: Text(
                      "Meet the highest-performing inboard\nwaterski boat ever created",
                    ),
                  ),
                  Text(
                    "SPEC",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  BoatSpec(t1: "Boat length", t2: "24\""),
                  BoatSpec(t1: "Beam", t2: "104\""),
                  BoatSpec(t1: "Weight", t2: "2345 Kg"),
                  BoatSpec(t1: "Fuel Capacity", t2: "250 L"),
                  Gallery(),
                  Gallery(
                    title: "RELATED BOATS",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}