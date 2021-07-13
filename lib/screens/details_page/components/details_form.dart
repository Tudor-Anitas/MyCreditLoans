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
  static bool isEmployed = false;

  @override
  _DetailsFormState createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController income = TextEditingController();

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
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      width: windowWidth,
      height: windowHeight * 0.65,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: windowHeight * 0.6 * 0.05,
            ),
            Container(
              child: const Text('Please complete the form to continue'),
            ),
            SizedBox(
              height: windowHeight * 0.6 * 0.05,
            ),
            Container(
              width: windowWidth * 0.75,
              child: Input(
                hint: 'First and last name',
                controller: name,
                validator: InputValidators().nameValidator,
              ),
            ),
            SizedBox(
              height: windowHeight * 0.6 * 0.02,
            ),
            EmploymentStatus(),
            SizedBox(
              height: windowHeight * 0.6 * 0.02,
            ),
            Container(
              width: windowWidth * 0.75,
              child: Input(
                  hint: 'Job title',
                  controller: job,
                  validator: InputValidators().jobValidator),
            ),
            SizedBox(
              height: windowHeight * 0.6 * 0.02,
            ),
            Container(
              width: windowWidth * 0.75,
              height: windowHeight * 0.6 * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: windowWidth * 0.35,
                          child: Input(
                            hint: 'Monthly income',
                            inputType: TextInputType.number,
                            hintSize: 14,
                            controller: income,
                            validator: InputValidators().incomeValidator,
                          ),
                        ),
                        Container(
                          width: windowWidth * 0.35,
                          margin:
                              EdgeInsets.only(top: windowHeight * 0.6 * 0.05),
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
                        width: windowWidth * 0.3,
                        isSelected: galleryImage != null,
                      ))
                ],
              ),
            ),
            SizedBox(height: windowHeight * 0.05),
            ValidateButton(onPressed: () async {
              await validator();
            })
          ],
        ),
      ),
    );
  }
}
