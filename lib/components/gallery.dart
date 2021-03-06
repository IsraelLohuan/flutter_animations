
import 'package:flutter/material.dart';
import 'package:flutter_boats_challenge/app_const.dart';
import 'package:flutter_boats_challenge/components/gallery_image.dart';

class Gallery extends StatelessWidget {
  const Gallery({
    Key key,
    this.title = "GALLERY",
  }) : super(key: key);

  final title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppConst.padding * 2),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GalleryImage(
                size: size,
                img: 'assets/gallery.jpeg',
              ),
              GalleryImage(
                size: size,
                img: 'assets/gallery1.jpeg',
              ),
              GalleryImage(
                size: size,
                img: 'assets/gallery2.jpeg',
              ),
              GalleryImage(
                size: size,
                img: 'assets/gallery3.jpeg',
              ),
            ],
          ),
        )
      ],
    );
  }
}
