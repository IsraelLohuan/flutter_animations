import 'package:flutter/material.dart';
import 'package:flutter_boats_challenge/app_const.dart';

class BoatCloseBtn extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      return Positioned(
      left: AppConst.padding,
      top: AppConst.padding * 4,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.close,
            color: Colors.black.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}