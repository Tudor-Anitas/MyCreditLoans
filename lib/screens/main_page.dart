
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_credit_loans/colors.dart';
import 'package:my_credit_loans/screens/cost_pop_up.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  // controls for the loan form
  double _panelHeight = 0;
  double _panelWidth = 0;
  double _panelY = 0;

  //controls for the cost pop up
  double _popupHeight = 0;
  double _popupWidth = 0;
  double _popupY = 0;


  double _currentLoanValue = 100;
  List<String> timePeriods = ['1 month', '3 months', '6 months', '1 year'];
  String? _shownPeriodOfTime = '1 month';

  int _pageState = 0;
  @override
  Widget build(BuildContext context) {

    // takes the size of the screen
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    switch(_pageState){
      case 0:
        // show the loan form
        _panelY = windowHeight * 0.35;
        _panelHeight = windowHeight * 0.65;
        _panelWidth = windowWidth * 0.9;

        // hide the cost pop up
        _popupY = -windowHeight * 0.5;
        break;
      case 1:
        // hide the loan form
        _panelY = windowHeight;

        // show the cost pop up
        _popupY = windowHeight * 0.25;
        break;
    }

    return Scaffold(
      backgroundColor: kXiketic,
      body: Container(
        height: windowHeight,
        width: windowWidth,
        child: Stack(
          children: [
            //--------------------------------- Welcome headline
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome!', style: GoogleFonts.lobster(fontSize: 62, color: kSeaShell),),
                ],
              ),
              transform: Matrix4.translationValues(0, windowHeight * 0.1, 1),
            ),
            //--------------------------------- Main form of loan
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              transform: Matrix4.translationValues(0, _panelY, 1),
              width: _panelWidth,
              height: _panelHeight ,
              margin: EdgeInsets.only(left: windowHeight * 0.025),
              decoration: BoxDecoration(
                color: kSeaShell,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),
              child: GestureDetector(
                onTap: ()=>print('column'),
                child: Column(
                  children: [
                    Expanded(flex: 10, child: Container(),),
                    //--------------------------------- Headline
                    Expanded(
                      flex: 20,
                      child: Column(
                        children: [
                          Text('Please select the', style: GoogleFonts.montserrat(fontSize: 24, color: kXiketic, fontWeight: FontWeight.w500),),
                          Text('desired sum', style: GoogleFonts.montserrat(fontSize: 24, color: kXiketic, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    //--------------------------------- Amount of load slider
                    Expanded(
                      flex: 20,
                      child: Container(
                        width: windowWidth * 0.75,
                        child: Column(
                          children: [
                            Slider(
                              value: _currentLoanValue,
                              min: 100,
                              max: 1000,
                              divisions: 18,
                              label: _currentLoanValue.toString(),
                              onChanged: (double value) {
                                setState(() {
                                  print(value);
                                  _currentLoanValue = value;
                                });
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('100', style: GoogleFonts.montserrat(fontSize: 20, color: kGrey, fontWeight: FontWeight.w500)),
                                Text('1000', style: GoogleFonts.montserrat(fontSize: 20, color: kGrey, fontWeight: FontWeight.w500))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 10, child: Container(),),
                    //--------------------------------- The period of time for loan
                    Expanded(
                      flex: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //--------------------------------- headings
                          Container(
                            width: windowWidth * 0.4,
                            height: windowHeight,
                            child: Column(
                              children: [
                                Text('The period', style: GoogleFonts.montserrat(fontSize: 20, color: kXiketic, fontWeight: FontWeight.w500)),
                                Text('of time for', style: GoogleFonts.montserrat(fontSize: 20, color: kXiketic, fontWeight: FontWeight.w500)),
                                Text('the loan', style: GoogleFonts.montserrat(fontSize: 20, color: kXiketic, fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                          //--------------------------------- dropdown
                          Container(
                            width: windowWidth * 0.3,
                            height: windowHeight,
                            margin: EdgeInsets.only(right: windowWidth * 0.05),
                            child: Column(
                              children: [
                                DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _shownPeriodOfTime,
                                    style: GoogleFonts.montserrat(fontSize: 18, color: kXiketic),
                                    items: timePeriods.map((period){
                                      return DropdownMenuItem(
                                        child: Text(period),
                                        value: period
                                      );
                                    }).toList(),
                                    onChanged: (period){
                                      setState(() {
                                        print(period);
                                        _shownPeriodOfTime = period;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 28,
                      child: Container(),
                    ),
                    //--------------------------------- Continue button
                    Expanded(
                      flex: 12,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: kGreenCyan,
                        ),
                        child: MaterialButton(
                          minWidth: windowWidth * 0.65,
                          height: windowHeight,
                          child: Text('Continue', style: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500),),
                          onPressed: (){
                            setState(() {
                              _pageState = 1;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(flex: 5, child: Container(),)
                  ],
                ),
              )
            ),
            //--------------------------------- Cost pop up
            Padding(
              padding: EdgeInsets.only(left: windowWidth * 0.05),
              child: CostPopUp(
                width: windowWidth * 0.9,
                height: windowHeight * 0.5,
                yPosition: _popupY,
                cancelAction: (){
                  setState(() {
                    _pageState = 0;
                  });
                },
                acceptAction: (){
                  setState(() {
                    _pageState = 0;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
