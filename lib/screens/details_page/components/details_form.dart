import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_credit_loans/methods.dart';
import 'package:my_credit_loans/screens/details_page/components/gallery_image_picker.dart';
import 'package:my_credit_loans/screens/details_page/components/employment_status.dart';
import 'package:my_credit_loans/screens/results_page/results_page.dart';
import 'package:my_credit_loans/widgets/input.dart';
import 'package:my_credit_loans/widgets/validate_button.dart';
import 'package:page_transition/page_transition.dart';

/// Creates a form to get information about the user
class DetailsForm extends StatefulWidget {

  late double width;
  late double height;
  late String screenType;
  // keeps the state of the employed and unemployed buttons
  static bool isEmployed = false;

  /// Creates a form used to gather the remaining information about the
  /// economical state of the user before creating a score for the request
  DetailsForm({
    required this.width,
    required this.height,
    required this.screenType
  });

  @override
  _DetailsFormState createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {

  // input controllers for the needed fields
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController income = TextEditingController();

  // the space between the continue button and the pick image button
  late double buttonMargin;

  // snackBars to be shown in case of errors or exceptions
  SnackBar _invalidInputSnackBar = SnackBar(content: Text('Please fill all the fields!'));
  SnackBar _httpErrorSnackBar = SnackBar(content: Text('A problem occurred with your request! Try again later'));

  static PickedFile? galleryImage; // the image picked from the gallery
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // key for the form

  /// This method will open the system's gallery to pick a image
  pickImage() async {
    galleryImage = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  /// This method validates the form to check for errors and to fetch the score
  /// from the API
  validator() async{
    // fetch the score from the API
    int score = await getScore();

    // if there is a internet problem or response code other than 'OK', halt the operation
    if(score == -2) {
      ScaffoldMessenger.of(context).showSnackBar(_httpErrorSnackBar);
      return;
    }

    // if the form is not null and
    // the state is validated and
    // the image was picked from the gallery
    // go to the ResultsPage
    if(_formKey.currentState != null &&
        _formKey.currentState!.validate() &&
        galleryImage != null
    )
      Navigator.push(context, PageTransition(child: ResultsPage(score: score,), type: PageTransitionType.fade));
    else
      ScaffoldMessenger.of(context).showSnackBar(_invalidInputSnackBar);
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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: widget.height * 0.05,),
            Text('Please complete the'),
            Text('form to continue'),
            SizedBox(height: widget.height * 0.05,),
            Input(
              width: widget.width * 0.75,
              height: widget.height * 0.08,
              hint: 'Last and first name',
              controller: name,
              validator: InputValidators().nameValidator,
            ),
            SizedBox(height: widget.height * 0.02,),
            EmploymentStatus(width: widget.width, height: widget.height),
            SizedBox(height: widget.height * 0.02,),
            Input(
              width: widget.width * 0.75,
              height: widget.height * 0.08,
              hint: 'Job title',
              controller: job,
              validator: InputValidators().jobValidator
            ),
            SizedBox(height: widget.height * 0.02,),
            Container(
              width: widget.width * 0.75,
              height: widget.height * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Input(
                          width: widget.width * 0.35,
                          height: widget.height * 0.08,
                          hint: 'Monthly income',
                          inputType: TextInputType.number,
                          hintSize: 14,
                          controller: income,
                          validator: InputValidators().incomeValidator,
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
                        ),
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
            SizedBox(height: buttonMargin,),
            ValidateButton(width: widget.width * 0.8, height: widget.height * 0.08, onPressed: () async{
              await validator();
            })
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    switch(widget.screenType){
      case 'large':
        buttonMargin = widget.height * 0.15;
        break;
      case 'normal':
        buttonMargin = widget.height * 0.1;
        break;
      case 'small':
        break;
    }
  }
}
