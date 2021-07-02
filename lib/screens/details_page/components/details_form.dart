import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_credit_loans/screens/details_page/components/gallery_image_picker.dart';
import 'package:my_credit_loans/screens/details_page/components/employment_status.dart';
import 'package:my_credit_loans/widgets/input.dart';
import 'package:my_credit_loans/widgets/validate_button.dart';

class DetailsForm extends StatefulWidget {

  late double width;
  late double height;
  // keeps the state of the employed and unemployed buttons
  static bool isEmployed = false;


  DetailsForm({
    required this.width,
    required this.height
  });

  @override
  _DetailsFormState createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {

  // input controllers for the needed fields
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController income = TextEditingController();

  // the image picked from the gallery
  PickedFile? galleryImage;

  pickImage() async {
    galleryImage = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
      ),
      child: Column(
        children: [
          SizedBox(height: widget.height * 0.05,),
          Text('Please complete the'),
          Text('form to continue'),
          SizedBox(height: widget.height * 0.1,),
          Input(
            width: widget.width * 0.75,
            height: widget.height * 0.065,
            hint: 'Last and first name',
            controller: name,
            validator: (String? value){},
          ),
          SizedBox(height: widget.height * 0.02,),
          EmploymentStatus(width: widget.width, height: widget.height),
          SizedBox(height: widget.height * 0.02,),
          Input(
            width: widget.width * 0.75,
            height: widget.height * 0.065,
            hint: 'Job title',
            controller: job,
            validator: (String? value){},
          ),
          SizedBox(height: widget.height * 0.005,),
          Container(
            width: widget.width * 0.75,
            height: widget.height * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: widget.width * 0.02),
                  child: Column(
                    children: [
                      Input(
                        width: widget.width * 0.35,
                        height: widget.height * 0.065,
                        hint: 'Monthly income',
                        inputType: TextInputType.number,
                        hintSize: 14,
                        controller: income,
                        validator: (String? value){},
                      ),
                      Container(
                        width: widget.width * 0.35,
                        margin: EdgeInsets.only(top: widget.height * 0.05),
                        child: Column(
                          children: [
                            Text('Please add a photo', style: Theme.of(context).textTheme.caption,),
                            Text('with your last bill', style: Theme.of(context).textTheme.caption)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: pickImage,
                    child: GalleryImagePicker(width: widget.width * 0.3, isSelected: galleryImage != null,)
                )
              ],
            ),
          ),
          SizedBox(height: widget.height * 0.15,),
          ValidateButton(width: widget.width * 0.8, height: widget.height * 0.08, onPressed: (){})
        ],
      ),
    );
  }
}
