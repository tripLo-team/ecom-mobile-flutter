import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  String imgPath;
  String fallbackImagePath = 'assets/no-image-available.png';

  RoundedImage({this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      type: MaterialType.circle,
      color: Colors.transparent,
      child: Ink.image(
        image:
            // imgPath != null
            //     ? NetworkImage(
            //         imgPath,
            //       )
            //     :
            AssetImage(fallbackImagePath),
        fit: BoxFit.cover,
        width: 120.0,
        height: 120.0,
        child: InkWell(
          onTap: () {},
          child: null,
        ),
      ),
    );
  }
}
