
import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_credit_loans/colors.dart';
import 'package:my_credit_loans/screens/cost_pop_up.dart';
import 'package:my_credit_loans/screens/details_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  // controls for the loan form
  double _panelHeight = 0;
  double _panelWidth = 0;
  double _panelY = 0;
  double _panelX = 0;
  double _panelOpacity = 1.0;

  //controls for the cost pop up
  double _popupHeight = 0;
  double _popupWidth = 0;
  double _popupY = 0;
  double _popupX = 0;

  // controls for the details form
  double _detailsHeight = 0;
  double _detailsWidth = 0;
  double _detailsY = 0;
  double _paymentDetailsY = 0;


  double _currentLoanValue = 100; // the value of the loan
  List<String> timePeriods = ['1 month', '3 months', '6 months', '1 year']; // the time periods of the loan
  String? _shownPeriodOfTime = '1 month'; // what period of time is selected

  // the text fields for the detail page
  List<TextEditingController> detailsControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  double monthlyPayment = 0; // the amount of money the user must pay monthly

  int _pageState = 0; // defines the state of the page
  @override
  Widget build(BuildContext context) {

    // takes the size of the screen
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    // sizes for the panels
    _popupHeight = windowHeight * 0.5;
    _popupWidth = windowWidth * 0.9;

    _detailsHeight = windowHeight;
    _detailsWidth = windowWidth * 0.9;

    // control the state of the application
    switch(_pageState){
      case 0:
        // show the loan form
        _panelY = windowHeight * 0.35;
        _panelX = windowWidth * 0.05;
        _panelWidth = windowWidth * 0.9;
        _panelOpacity = 1.0;

        _panelHeight = windowHeight * 0.65;
        _panelWidth = windowWidth * 0.9;

        // hide the cost pop up
        _popupY = -windowHeight * 1.0;
        _popupX = 0;

        // hide the details page
        _detailsY = windowHeight;
        _paymentDetailsY = -windowHeight * 0.5;
        break;

      case 1:
        // hide the loan form
        _panelY = windowHeight;

        // hide the details page
        _detailsY = windowHeight;
        _paymentDetailsY = -windowWidth * 0.5;

        // show the cost pop up
        _popupHeight = windowHeight * 0.5;
        _popupY = windowHeight * 0.0;
        _popupX = 0;
        break;

      case 2:
        // hide the cost pop up
        //_popupY = -windowHeight * 1.0;
        _popupX = -windowWidth * 1;

        // set the panel according to the state of the keyboard, if it is open or closed
        _panelY = MediaQuery.of(context).viewInsets.bottom != 0.0 ?
                     windowHeight * 0.1 : windowWidth * 0.62;

        _panelX = windowWidth * 0.1;
        _panelWidth = windowWidth * 0.8;
        _panelOpacity = 0.7;

        // set the panel according to the state of the keyboard, if it is open or closed
        _paymentDetailsY = MediaQuery.of(context).viewInsets.bottom != 0.0 ?
                            -windowHeight * 0.3 : windowHeight * 0.05;


        // bring the details form in front
        // after a small delay for a better transition
        if(MediaQuery.of(context).viewInsets.bottom != 0.0)
          _detailsY = -windowHeight * 0.2;
        else
          Timer(Duration(milliseconds: 75), (){
            setState(() {
              _detailsY = windowHeight * 0;
            });
          });


        break;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              transform: Matrix4.translationValues(_panelX, _panelY, 1),
              width: _panelWidth,
              height: _panelHeight ,
              //margin: EdgeInsets.only(left: windowWidth * 0.05),
              decoration: BoxDecoration(
                color: kSeaShell.withOpacity(_panelOpacity),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),
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
                        boxShadow: [
                          BoxShadow(offset: Offset(0.0, 4.0), blurRadius: 5.0, spreadRadius: 0, color: Colors.grey)
                        ]
                      ),
                      child: MaterialButton(
                        minWidth: windowWidth * 0.65,
                        height: windowHeight,
                        child: Text('Continue', style: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500),),
                        onPressed: (){
                          setState(() {
                            // we add 1% to the current value chosen to loan
                            double finalLoanValue = _currentLoanValue + (_currentLoanValue / 100);

                            // calculate the monthly payment
                            switch(_shownPeriodOfTime){
                              case '1 month':
                                monthlyPayment = finalLoanValue;
                                break;
                              case '3 months':
                                monthlyPayment = finalLoanValue/3;
                                monthlyPayment.round();
                                break;
                              case '6 months':
                                monthlyPayment = finalLoanValue/6;
                                monthlyPayment.round();
                                break;
                              case '1 year':
                                monthlyPayment = finalLoanValue/12;
                                monthlyPayment.round();
                                break;
                            }

                            // show the cost pop up with the updated data
                            _pageState = 1;

                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(flex: 5, child: Container(),)
                ],
              )
            ),
            //--------------------------------- Cost pop up
            Padding(
              padding: EdgeInsets.only(left: windowWidth * 0.05),
              child: CostPopUp(
                width: _popupWidth,
                height: _popupHeight,
                yPosition: _popupY,
                xPosition: _popupX,
                monthlyPayment: monthlyPayment,
                cancelAction: (){
                  setState(() {
                    _pageState = 0;
                    monthlyPayment = 0;
                  });
                },
                acceptAction: (){
                  setState(() {
                    _pageState = 2;
                  });
                },
              ),
            ),
            //--------------------------------- Details about payment
            Padding(
              padding: EdgeInsets.only(left: windowWidth * 0.1),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                transform: Matrix4.translationValues(0, _paymentDetailsY, 1),
                width: windowWidth * 0.8,
                height: windowHeight * 0.22,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: kGreenCyan
                ),
                child: Padding(
                  padding: EdgeInsets.all(windowHeight * 0.025),
                  child: Row(
                    children: [
                      Container(
                        width: windowWidth * 0.6,
                        //--------------------------------- headers
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: windowWidth * 0.6,
                                child: Text('Payment per month', style: GoogleFonts.montserrat(fontSize: 22, color: kSeaShell, fontWeight: FontWeight.w500),)),
                            Container(
                                width: windowWidth * 0.6,
                                child: Text('${monthlyPayment.round()} ron', style: GoogleFonts.montserrat(fontSize: 22, color: kXiketic, fontWeight: FontWeight.w500))
                            ),
                            Container(
                                width: windowWidth * 0.6,
                                child: Text('Period of time', style: GoogleFonts.montserrat(fontSize: 22, color: kSeaShell, fontWeight: FontWeight.w500),)),
                            Container(
                                width: windowWidth * 0.6,
                                child: Text('$_shownPeriodOfTime', style: GoogleFonts.montserrat(fontSize: 22, color: kXiketic, fontWeight: FontWeight.w500),))
                          ],
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
              ),
            ),
            //--------------------------------- Details page
            Padding(
              padding: EdgeInsets.only(left: windowWidth * 0.05),
              child: DetailsPage(
                width: _detailsWidth,
                height: _detailsHeight,
                yPosition: _detailsY,
                controllers: detailsControllers,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
