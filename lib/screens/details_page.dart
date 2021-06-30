
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_credit_loans/colors.dart';
import 'package:my_credit_loans/input.dart';
import 'package:my_credit_loans/screens/result_page.dart';
import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {

  late double width;
  late double height;
  late double yPosition;
  late List controllers;


  DetailsPage({
    required this.width,
    required this.height,
    required this.yPosition,
    required this.controllers,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  PickedFile? _galleryImage; // the image picked from the gallery
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _employed = false;

  SnackBar _invalidInputSnackBar = SnackBar(content: Text('Please fill all the fields!'));
  SnackBar _httpErrorSnackBar = SnackBar(content: Text('A problem occurred with your request! Try again later'));
  @override
  Widget build(BuildContext context) {

    //////////////////////////////////////////////////// METHODS
    ////////////////////////////////////////////////////

    /// Method to get a image from the gallery
    pickImage() async {
      _galleryImage = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
      setState(() {});
    }

    /// Call to the RandomNumberAPI to get the score for the application
    Future<int> getScore() async{
      try {
        Uri uri = Uri.parse(
            'http://www.randomnumberapi.com/api/v1.0/randomnumber?min=1&max=10&count=1');

        var response = await http.get(uri);
        var responseCode = response.statusCode;

        if (responseCode == 200) {
          var finalResponse = json.decode(response.body);
          return finalResponse[0];
        } else {
          ScaffoldMessenger.of(context).showSnackBar(_httpErrorSnackBar);
        }
      } catch (e){
        ScaffoldMessenger.of(context).showSnackBar(_httpErrorSnackBar);
      }
      return -1;
    }
    
    /// Method to validate the text fields 
    validator() async{

      int score = await getScore();

      // if there is a internet problem or response code other than 'OK', halt the operation
      if(score == -1)
        return;

      if(_formKey.currentState != null &&
          _formKey.currentState!.validate() &&
          _galleryImage != null
      )
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ResultPage(score: score,))
        );
      else
        ScaffoldMessenger.of(context).showSnackBar(_invalidInputSnackBar);
    }


    ////////////////////////////////////////////////////
    ////////////////////////////////////////////////////

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
              //--------------------------------- start of the form
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: widget.height * 0.03,),
                    //--------------------------------- heading
                    Column(
                      children: [
                        Text('Please complete the', style: GoogleFonts.montserrat(fontSize: 24, color: kXiketic, fontWeight: FontWeight.w500),),
                        Text('form to continue', style: GoogleFonts.montserrat(fontSize: 24, color: kXiketic, fontWeight: FontWeight.w500),)
                      ],
                    ),
                    SizedBox(height: widget.height * 0.03,),
                    //--------------------------------- Last and First name
                    Input(
                      width: widget.width * 0.8,
                      height: widget.height * 0.065,
                      controller: widget.controllers[0],
                      hint: 'Last and First name',
                      validator: (String? value){
                        if(value!.length < 3 || !value.contains(' '))
                          return 'Incorrect name';
                        return null;
                      },
                    ),
                    SizedBox(height: widget.height * 0.02,),
                    //--------------------------------- Occupation status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: widget.width * 0.375,
                          height: widget.height * 0.065,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: _employed ? kGreenCyan : kBlue
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              setState(() {
                                _employed = true;
                              });
                            },
                            child: Text('Employed', style: GoogleFonts.montserrat(fontSize: 16, color: _employed ? kSeaShell : kGrey)),
                          ),
                        ),
                        SizedBox(width: widget.width * 0.05,),
                        Container(
                          width: widget.width * 0.375,
                          height: widget.height * 0.065,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: _employed ? kBlue : kGreenCyan
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              setState(() {
                                _employed = false;
                              });
                            },
                            child: Text('Unemployed', style: GoogleFonts.montserrat(fontSize: 16, color: _employed ? kGrey : kSeaShell),),
                          )
                        )
                      ],
                    ),
                    SizedBox(height: widget.height * 0.02,),
                    //--------------------------------- Job title
                    Input(
                      width: widget.width * 0.8,
                      height: widget.height * 0.065,
                      controller: widget.controllers[2],
                      hint: 'Job title',
                      validator: (String? value){
                        if(_employed && value!.length ==0)
                          return 'Please write your job title';
                        return null;
                      },
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //--------------------------------- Monthly income
                                Input(
                                  width: widget.width * 0.45,
                                  height: widget.height * 0.065,
                                  controller: widget.controllers[3],
                                  inputType: TextInputType.number,
                                  hint: 'Monthly income',
                                  validator: (String? value){
                                    if(value!.length == 0)
                                      return 'Please write your income';
                                    return null;
                                  },
                                ),
                                Container(
                                  width: widget.width * 0.45,
                                  margin: EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Text('Please add a photo', style: GoogleFonts.montserrat(fontSize: 16, color: kXiketic),),
                                      Text('with your last bill', style: GoogleFonts.montserrat(fontSize: 16, color: kXiketic),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          //--------------------------------- Image picker
                          GestureDetector(
                            onTap: pickImage,
                            child: Container(
                              width: widget.width * 0.3,
                              height: widget.width * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: Color(0xffebebeb)
                              ),
                              child: Icon(
                                // if the image is picked successfully, the icon will change to a check sign
                                 _galleryImage == null? Icons.camera_alt : Icons.done,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: widget.height * 0.05,),
                    ///--------------------------------- Continue button
                    Container(
                      width: widget.width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: kGreenCyan,
                          boxShadow: [
                            BoxShadow(offset: Offset(0.0, 4.0), blurRadius: 5.0, spreadRadius: 0, color: Colors.grey)
                          ]
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          validator();
                        },
                        child: Text('Continue', style: GoogleFonts.montserrat(fontSize: 24, color: kSeaShell, fontWeight: FontWeight.w500),),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]
        )
      ),
    );
  }
}
