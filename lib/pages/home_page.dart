import 'package:flutter/material.dart';
import 'package:flutter_boats_challenge/app_const.dart';
import 'package:flutter_boats_challenge/components/boot_card.dart';
import 'package:flutter_boats_challenge/models/boat.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Boat> boats = [
    Boat(img: 'assets/boat1.png', text: 'X34 Force', text2: 'NeoKraft'),
    Boat(img: 'assets/boat2.png', text: 'Z24 Force', text2: 'NeoKraft'),
    Boat(img: 'assets/boat3.png', text: 'X54 No se', text2: 'NeoKraft'),
    Boat(img: 'assets/boat4.png', text: 'X54 Fun', text2: 'NeoKraft'),
  ];

  final PageController _pg = PageController();
  var _currentPage = 0.0;

  onPageChange() {
    setState(() {
      _currentPage = _pg.page;
    });
  }

  @override
  void initState() {
    _pg.addListener(onPageChange);
    super.initState();
  }

  @override
  void dispose() {
    _pg.removeListener(onPageChange);
    _pg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: "bg",
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [.85, 1.0],
                  colors: [Colors.white, Colors.blue],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConst.padding,
              vertical: AppConst.padding * 3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Boats",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    onPressed: () {})
              ],
            ),
          ),
          PageView.builder(
            controller: _pg,
            itemCount: boats.length,
            itemBuilder: (context, index) {
              final boat = boats[index];
              final value = index < _currentPage
                  ? _currentPage - index
                  : index - _currentPage;
              final opacity =
                  (1 - (value == 1.0 ? 1.0 : value * 2)).clamp(0.0, 1.0);
              return Transform.scale(
                scale: opacity.clamp(0.85, 1.0),
                child: Opacity(
                  opacity: opacity,
                  child: BoatCard(boat: boat),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
