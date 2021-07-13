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
  late final double width;
  late final double height;
  static bool isEmployed = false;

  DetailsForm(
      {required this.width, required this.height});

  @override
  _DetailsFormState createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController income = TextEditingController();

  late double buttonMargin;

  SnackBar _invalidInputSnackBar =
      SnackBar(content: Text('Please fill all the fields!'));
  SnackBar _httpErrorSnackBar = SnackBar(
      content: Text('A problem occurred with your request! Try again later'));

  static PickedFile? galleryImage; // the image picked from the gallery
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // key for the form

  /// Opens gallery to pick image
  pickImage() async {
    galleryImage = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {});
  }

  /// Validates the form
  validator() async {
    int score = await getScore();

    if (score == -2) {
      ScaffoldMessenger.of(context).showSnackBar(_httpErrorSnackBar);
      return;
    }
    if (_formKey.currentState != null &&
        _formKey.currentState!.validate() &&
        galleryImage != null)
      Navigator.push(
          context,
          PageTransition(
              child: ResultsPage(
                score: score,
              ),
              type: PageTransitionType.fade));
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
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: widget.height * 0.05,
            ),
            Text('Please complete the'),
            Text('form to continue'),
            SizedBox(
              height: widget.height * 0.05,
            ),
            Input(
              width: widget.width * 0.75,
              height: widget.height * 0.08,
              hint: 'Last and first name',
              controller: name,
              validator: InputValidators().nameValidator,
            ),
            SizedBox(
              height: widget.height * 0.02,
            ),
            EmploymentStatus(width: widget.width, height: widget.height),
            SizedBox(
              height: widget.height * 0.02,
            ),
            Input(
                width: widget.width * 0.75,
                height: widget.height * 0.08,
                hint: 'Job title',
                controller: job,
                validator: InputValidators().jobValidator),
            SizedBox(
              height: widget.height * 0.02,
            ),
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
                              Text(
                                'Please add a photo',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                'with your last bill',
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: pickImage,
                      child: GalleryImagePicker(
                        width: widget.width * 0.3,
                        isSelected: galleryImage != null,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: buttonMargin,
            ),
            ValidateButton(
                onPressed: () async {
                  await validator();
                })
          ],
        ),
      ),
    );
  }
}
