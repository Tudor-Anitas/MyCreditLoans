import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_credit_loans/methods.dart';
import 'package:my_credit_loans/common/gallery_image_picker.dart';
import 'package:my_credit_loans/common/employment_status.dart';
import 'package:my_credit_loans/screens/results_page.dart';
import 'package:my_credit_loans/common/input.dart';
import 'package:my_credit_loans/common/validate_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  static PickedFile? _galleryImage; // the image picked from the gallery
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // key for the form

  /// Opens gallery to pick image
  pickImage() async {
    PickedFile? pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _galleryImage = pickedImage;
    });
  }

  /// Validates the form
  validateForm() async {
    SnackBar _invalidFormSnackBar = SnackBar(
        content: Text(AppLocalizations.of(context)!.snackBarInvalidInput));
    SnackBar _httpErrorSnackBar = SnackBar(
        content: Text(AppLocalizations.of(context)!.snackBarHttpError));

    if (_formKey.currentState != null &&
        _formKey.currentState!.validate() &&
        _galleryImage != null) {
      int? score = await getScore();

      if (score == null) {
        ScaffoldMessenger.of(context).showSnackBar(_httpErrorSnackBar);
      } else {
        Navigator.push(
            context,
            PageTransition(
                child: ResultsPage(
                  score: score,
                ),
                type: PageTransitionType.fade));
      }
    } else
      ScaffoldMessenger.of(context).showSnackBar(_invalidFormSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      width: windowWidth,
      height: windowHeight * 0.65,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
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
              child: Text(AppLocalizations.of(context)!.formHeadline),
            ),
            SizedBox(
              height: windowHeight * 0.6 * 0.05,
            ),
            Container(
              width: windowWidth * 0.75,
              child: Input(
                hint: AppLocalizations.of(context)!.nameHint,
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
                  hint: AppLocalizations.of(context)!.jobHint,
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
                            hint: AppLocalizations.of(context)!.monthlyIncome,
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
                          child: Text(
                            AppLocalizations.of(context)!.addPhoto,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: pickImage,
                      child: GalleryImagePicker(
                        width: windowWidth * 0.3,
                        isSelected: _galleryImage != null,
                      ))
                ],
              ),
            ),
            SizedBox(height: windowHeight * 0.05),
            ValidateButton(onPressed: () async {
              await validateForm();
            })
          ],
        ),
      ),
    );
  }
}
