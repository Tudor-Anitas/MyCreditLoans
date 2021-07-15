import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_credit_loans/common/form_validators.dart';
import 'package:my_credit_loans/common/gallery_image_picker.dart';
import 'package:my_credit_loans/common/employment_status.dart';
import 'package:my_credit_loans/screens/results_page.dart';
import 'package:my_credit_loans/common/input.dart';
import 'package:my_credit_loans/common/validate_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:my_credit_loans/form_data_model.dart';

/// Creates a form to get information about the user
class DetailsForm extends StatefulWidget {
  static bool isEmployed = false;

  @override
  _DetailsFormState createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  late TextEditingController name;
  late TextEditingController job;
  late TextEditingController income;

  @override
  void initState() {
    final FormData formDate = Provider.of<FormData>(context, listen: false);
    super.initState();
    name = TextEditingController(text: formDate.getUserName());
    job = TextEditingController(text: formDate.getUserJob());
    income = TextEditingController(text: formDate.getUserIncome());
  }

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
    if (_formKey.currentState != null &&
        _formKey.currentState!.validate() &&
        _galleryImage != null) {
      await Provider.of<FormData>(context, listen: false).updateUserScore();

      if (Provider.of<FormData>(context, listen: false).getUserScore() ==
          null) {
        showToast(AppLocalizations.of(context)!.snackBarHttpError,
            context: context,
            animation: StyledToastAnimation.slideFromBottomFade);
      } else {
        Navigator.push(
            context,
            PageTransition(
                child: ResultsPage(), type: PageTransitionType.fade));
      }
    } else
      showToast(AppLocalizations.of(context)!.snackBarInvalidInput,
          context: context,
          animation: StyledToastAnimation.slideFromBottomFade);
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
      child: Consumer<FormData>(
        builder: (context, value, child) => Form(
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
                  onChanged: (userName) => value.updateUserName(userName),
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
                  onChanged: (userJob) => value.updateUserJob(userJob),
                  validator: (userJob) {
                    if (value.getEmploymentStatus() && userJob!.length < 3) {
                      return '';
                    }
                    return null;
                  },
                ),
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
                              onChanged: (userIncome) =>
                                  value.updateUserIncome(userIncome),
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
      ),
    );
  }
}
