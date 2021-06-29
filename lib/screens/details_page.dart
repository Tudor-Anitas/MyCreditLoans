import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_credit_loans/colors.dart';
import 'package:my_credit_loans/input.dart';

class DetailsPage extends StatefulWidget {

  late double width;
  late double height;
  late double yPosition;
  late var continueAction;
  late List controllers;


  DetailsPage({
    required this.width,
    required this.height,
    required this.yPosition,
    required this.continueAction,
    required this.controllers,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // makes sure the keyboard is unfocused when it's not used
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus){
          currentFocus.unfocus();
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        transform: Matrix4.translationValues(0, widget.yPosition, 1),
        width: widget.width,
        height: widget.height,
        child: Column(
          children: [
            Container(
              height: widget.height * 0.35,
              width: widget.width,
            ),
            Container(
              height: widget.height * 0.65,
              width: widget.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  color: kSeaShell
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: widget.height * 0.03,),
                  Column(
                    children: [
                      Text('Please complete the', style: GoogleFonts.montserrat(fontSize: 24, color: kXiketic, fontWeight: FontWeight.w500),),
                      Text('form to continue', style: GoogleFonts.montserrat(fontSize: 24, color: kXiketic, fontWeight: FontWeight.w500),)
                    ],
                  ),
                  SizedBox(height: widget.height * 0.03,),
                  Input(
                    width: widget.width * 0.8,
                    height: widget.height * 0.065,
                    controller: widget.controllers[0],
                    hint: 'Last and First name',
                  ),
                  SizedBox(height: widget.height * 0.02,),
                  Input(
                    width: widget.width * 0.8,
                    height: widget.height * 0.065,
                    controller: widget.controllers[1],
                    hint: 'Occupational status',
                  ),
                  SizedBox(height: widget.height * 0.02,),
                  Input(
                    width: widget.width * 0.8,
                    height: widget.height * 0.065,
                    controller: widget.controllers[2],
                    hint: 'Job title',
                  ),
                  SizedBox(height: widget.height * 0.02,),
                  Container(
                    width: widget.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: widget.width * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Input(
                                width: widget.width * 0.45,
                                height: widget.height * 0.065,
                                controller: widget.controllers[3],
                                inputType: TextInputType.number,
                                hint: 'Monthly income',
                              ),
                              SizedBox()
                            ],
                          ),
                        ),
                        Container(
                          width: widget.width * 0.3,
                          height: widget.width * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: Color(0xffebebeb)
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 50.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: widget.height * 0.05,),
                  Container(
                    width: widget.width * 0.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: kGreenCyan
                    ),
                    child: MaterialButton(
                      onPressed: widget.continueAction,
                      child: Text('Continue', style: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500),),
                    ),
                  ),
                ],
              ),
            )
          ]
        )
      ),
    );
  }
}
