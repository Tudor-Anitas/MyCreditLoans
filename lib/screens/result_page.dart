import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_credit_loans/colors.dart';
import 'package:my_credit_loans/screens/main_page.dart';

class ResultPage extends StatefulWidget {

  late int score;

  ResultPage({required this.score});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  double _pageY = 0;

  @override
  Widget build(BuildContext context) {

    // takes the size of the screen
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async{
         Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPage())
        );
         return false;
      },
      child: Scaffold(
        backgroundColor: kXiketic,
        body: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(0, _pageY, 1),
            width: windowWidth * 0.9,
            height: windowHeight * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: widget.score >= 7 ? kGreenCyan : kRedPigment
            ),
            child: Column(
              children: [
                SizedBox(height: windowHeight * 0.15,),
                Text('Your application was', style: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500),),
                widget.score >= 7 ? Text('successful!', style: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500),) :
                                    Text('unsuccessful!', style: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500),),
                widget.score >= 7 ? Icon(Icons.cake, color: kSeaShell, size: 42) : Icon(Icons.mood_bad, color: kSeaShell, size: 42),
                Text('Your credit score is', style: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500),),
                Text('${widget.score}', style: GoogleFonts.montserrat(fontSize: 64, color: kSeaShell, fontWeight: FontWeight.w500),),
                SizedBox(height: windowHeight * 0.1,),
                Container(
                  width: windowWidth * 0.35,
                  height: windowHeight * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kSeaShell,
                      boxShadow: [
                        BoxShadow(offset: Offset(0.0, 4.0), blurRadius: 5.0, spreadRadius: 0, color: Colors.grey)
                      ]
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage())
                      );
                    },
                    child: Text('Finish', style: GoogleFonts.montserrat(fontSize: 24, color: kXiketic, fontWeight: FontWeight.w500),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

