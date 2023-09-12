import 'package:flutter/material.dart';

Widget customImageView(String imageAddress, double radius, double elevation, double size) {
  return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: SizedBox(
          width: size,
          height: size,
          child: ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(radius)),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageAddress),
                        fit: BoxFit.cover)),
              ))),
    );
}
