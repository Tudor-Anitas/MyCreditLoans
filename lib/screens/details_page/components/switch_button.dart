import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchButton extends StatefulWidget {

  late double width;
  late double height;
  late String title;
  bool isActive;

  SwitchButton({
    required this.width,
    required this.height,
    required this.title,
    this.isActive = false,
  });

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.isActive ? Theme.of(context).toggleableActiveColor : Theme.of(context).disabledColor,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Center(
        child: Container(
            width: widget.width,
            padding: EdgeInsets.only(left: 10),
            child: Text('${widget.title}',
              style: widget.isActive? GoogleFonts.montserrat(fontSize: 16, color: Theme.of(context).backgroundColor) :
                                      GoogleFonts.montserrat(fontSize: 16, color: Theme.of(context).hintColor)
            )
        ),
      ),
    );
  }
}
