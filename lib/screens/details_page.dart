
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

  SnackBar _invalidInputSnackBar = SnackBar(content: Text('Please fill all the fields!'));
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
      Uri uri = Uri.parse('http://www.randomnumberapi.com/api/v1.0/randomnumber?min=1&max=10&count=1');

      var response = await http.get(uri);
      var responseCode = response.statusCode;

      if(responseCode == 200){
        var finalResponse = json.decode(response.body);
        return finalResponse[0];
      } else{
        print('a problem occured');
      }
      return -1;
    }
    
    /// Method to validate the text fields 
    validator() async{

      int score = await getScore();

      if(_formKey.currentState != null &&
          _formKey.currentState!.validate() &&
          _galleryImage != null &&
          score > -1
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
                    Input(
                      width: widget.width * 0.8,
                      height: widget.height * 0.065,
                      controller: widget.controllers[1],
                      hint: 'Occupational status',
                      validator: (String? value){
                        if(value!.length < 3)
                          return 'Incorrect occupation';
                        return null;
                      },
                    ),
                    SizedBox(height: widget.height * 0.02,),
                    //--------------------------------- Job title
                    Input(
                      width: widget.width * 0.8,
                      height: widget.height * 0.065,
                      controller: widget.controllers[2],
                      hint: 'Job title',
                      validator: (String? value){
                        if(value!.length < 3)
                          return 'Incorrect title';
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //--------------------------------- Monthly income
                                Input(
                                  width: widget.width * 0.45,
                                  height: widget.height * 0.065,
                                  controller: widget.controllers[3],
                                  inputType: TextInputType.number,
                                  hint: 'Monthly income',
                                  validator: (String? value){
                                    return null;
                                  },
                                ),
                                SizedBox()
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
