import 'package:flutter/material.dart';

import '../../../colors.dart';

class GalleryImagePicker extends StatelessWidget {
  late final double width;
  final bool isSelected;

  GalleryImagePicker({
    required this.width,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
            color: kBlue, borderRadius: BorderRadius.all(Radius.circular(8))),
        child: isSelected
            ? Icon(
                Icons.check,
                size: 50,
                color: Theme.of(context).hintColor,
              )
            : Icon(
                Icons.photo_camera,
                size: 50,
                color: Theme.of(context).hintColor,
              ));
  }
}
