import 'package:flutter/material.dart';

import '../../../colors.dart';

class GalleryImagePicker extends StatelessWidget {

  late double width;
  bool isSelected;

  /// Creates a button widget to access the gallery and pick a image
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
        color: kBlue,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: isSelected?  Icon(Icons.check, size: 50, color: Theme.of(context).hintColor,):
                          Icon(Icons.photo_camera, size: 50, color: Theme.of(context).hintColor,)
    );
  }
}
