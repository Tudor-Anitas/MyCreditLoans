import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchButton extends StatefulWidget {
  late final double width;
  late final double height;
  late final String title;
  final bool isActive;

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
          color: widget.isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).disabledColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Center(
        child: Container(
            width: widget.width,
            padding: EdgeInsets.only(left: 10),
            child: Text('${widget.title}',
                style: widget.isActive
                    ? GoogleFonts.montserrat(
                        fontSize: 12, color: Theme.of(context).colorScheme.background)
                    : GoogleFonts.montserrat(
                        fontSize: 12, color: Theme.of(context).hintColor))),
      ),
    );
  }
}
