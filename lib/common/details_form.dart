import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_credit_loans/blocks/application_states.dart';
import 'package:my_credit_loans/blocks/form_bloc.dart';
import 'package:my_credit_loans/blocks/application_events.dart';
import 'package:my_credit_loans/common/form_validators.dart';
import 'package:my_credit_loans/common/gallery_image_picker.dart';
import 'package:my_credit_loans/common/employment_status.dart';
import 'package:my_credit_loans/screens/results_page.dart';
import 'package:my_credit_loans/common/input.dart';
import 'package:my_credit_loans/common/validate_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

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
    super.initState();
    name = TextEditingController(text: '');
    job = TextEditingController(text: '');
    income = TextEditingController(text: '');
  }

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // key for the form

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<FormBloc, ApplicationState>(
      builder: (context, state) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          if (state.runtimeType == HttpErrorState) {
            showToast(AppLocalizations.of(context)!.snackBarHttpError,
                context: context,
                animation: StyledToastAnimation.slideFromBottomFade);
          } else if (state.runtimeType == InvalidInputState) {
            print('invalid input');
            showToast(AppLocalizations.of(context)!.snackBarInvalidInput,
                context: context,
                animation: StyledToastAnimation.slideFromBottomFade);
          } else if (state.runtimeType == FinishedFormState) {
            Navigator.push(
                context,
                PageTransition(
                    child: ResultsPage(), type: PageTransitionType.fade));
          }
        });

        return Container(
            width: windowWidth,
            height: windowHeight * 0.65,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
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
                      onChanged: (userName) => {
                        context
                            .read<FormBloc>()
                            .add(ChangeNameEvent(name: userName))
                      },
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
                      onChanged: (userJob) => {
                        context
                            .read<FormBloc>()
                            .add(ChangeJobEvent(job: userJob))
                      },
                      validator: (userJob) {
                        if (state.formData.isEmployed && userJob!.length < 3) {
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
                                  hint: AppLocalizations.of(context)!
                                      .monthlyIncome,
                                  inputType: TextInputType.number,
                                  hintSize: 14,
                                  controller: income,
                                  onChanged: (userIncome) => {
                                    context.read<FormBloc>().add(
                                        ChangeIncomeEvent(income: userIncome))
                                  },
                                  validator: InputValidators().incomeValidator,
                                ),
                              ),
                              Container(
                                width: windowWidth * 0.35,
                                margin: EdgeInsets.only(
                                    top: windowHeight * 0.6 * 0.05),
                                child: Text(
                                  AppLocalizations.of(context)!.addPhoto,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              context.read<FormBloc>().add(ChangeImageEvent(
                                  image: await ImagePicker()
                                      .getImage(source: ImageSource.gallery)));
                            },
                            child: GalleryImagePicker(
                              width: windowWidth * 0.3,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: windowHeight * 0.05),
                  ValidateButton(onPressed: () async {
                    context.read<FormBloc>().add(ValidateFormEvent(
                        currentForm: state.formData, formKey: _formKey));
                  })
                ],
              ),
            ));
      },
    );
  }
}
