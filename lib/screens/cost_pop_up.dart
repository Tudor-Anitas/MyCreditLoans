import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_credit_loans/colors.dart';

class CostPopUp extends StatefulWidget {

  late double yPosition;
  late double width;
  late double height;
  late double monthlyPayment;
  late var cancelAction;
  late var acceptAction;

  CostPopUp({
    required this.yPosition,
    required this.width,
    required this.height,
    required this.cancelAction,
    required this.acceptAction,
    required this.monthlyPayment,
  });

  @override
  _CostPopUpState createState() => _CostPopUpState();
}

class _CostPopUpState extends State<CostPopUp> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      transform: Matrix4.translationValues(0, widget.yPosition, 1),
      width: widget.width,
      height: widget.height * 1.5,
      child: Column(
        children: [
          Opacity(
            opacity: 0.0,
            child: Container(
              height: widget.height * 0.5,
              width: widget.width,
              color: Colors.white,
            ),
          ),
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
                color: kSeaShell,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Container(),
                ),
                Expanded(
                    flex: 10,
                    child: Text('The applied interest is 1%', style: GoogleFonts.montserrat(fontSize: 24, color: kXiketic, fontWeight: FontWeight.w500),)
                ),
                Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        Text('The payment for every', style: GoogleFonts.montserrat(fontSize: 24, color: kXiketic, fontWeight: FontWeight.w500),),
                        Text('month will be ${widget.monthlyPayment.round()} ron', style: GoogleFonts.montserrat(fontSize: 24, color: kXiketic, fontWeight: FontWeight.w500),),
                      ],
                    )
                ),
                Expanded(
                  flex: 10,
                  child: Container(),
                ),
                Expanded(
                  flex: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: widget.width * 0.4,
                        height: widget.height * 0.15,
                        child: MaterialButton(
                            onPressed: widget.cancelAction,
                            child: Text('Cancel', style: GoogleFonts.montserrat(fontSize: 24, color: kRedPigment, fontWeight: FontWeight.w400),)
                        ),
                      ),
                      Container(
                        width: widget.width * 0.4,
                        height: widget.height * 0.13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: kGreenCyan
                        ),
                        child: MaterialButton(
                            onPressed: widget.acceptAction,
                            child: Text('Accept', style: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500),)
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

