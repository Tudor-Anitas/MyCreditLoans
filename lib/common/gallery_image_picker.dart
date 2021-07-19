import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_credit_loans/blocks/form_bloc/application_states.dart';
import 'package:my_credit_loans/blocks/form_bloc/form_bloc.dart';

class GalleryImagePicker extends StatelessWidget {
  late final double width;

  GalleryImagePicker({
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, FormApplicationState>(
      builder: (context, state) {
        return Container(
            width: width,
            height: width,
            decoration: BoxDecoration(
                color: Theme.of(context).disabledColor,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: state.formData.image != null
                ? Icon(
                    Icons.check,
                    size: 50,
                    color: Theme.of(context).hintColor,
                  )
                : Icon(
                    Icons.photo_camera,
                    size: 50,
                    color: Theme.of(context).hintColor,
                  ));
      },
    );
  }
}
