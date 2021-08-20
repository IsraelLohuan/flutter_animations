
import 'package:flutter/material.dart';
import 'package:flutter_boats_challenge/app_const.dart';

class GalleryImage extends StatelessWidget {
  const GalleryImage({
    Key key,
    @required this.size,
    @required this.img,
  }) : super(key: key);

  final Size size;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .4,
      height: size.width * .3,
      margin: const EdgeInsets.only(right: AppConst.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConst.padding),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}