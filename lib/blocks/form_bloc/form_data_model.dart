import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
class FormDataModel extends Equatable {
  final double? loanValue;
  final int? loanPeriod;
  final String? userName;
  final String? userJob;
  final String? userIncome;
  final bool? isEmployed;
  final PickedFile? image;
  final int? score;

  FormDataModel(
      {this.loanValue,
      this.loanPeriod,
      this.userName,
      this.userJob,
      this.userIncome,
      this.isEmployed,
      this.image,
      this.score});

  FormDataModel copyWith({
    double? loanValue,
    int? loanPeriod,
    String? userName,
    String? userJob,
    String? userIncome,
    bool? isEmployed,
    PickedFile? image,
    int? score,
  }) {
    return FormDataModel(
      loanValue: loanValue ?? this.loanValue,
      loanPeriod: loanPeriod ?? this.loanPeriod,
      userName: userName ?? this.userName,
      userJob: userJob ?? this.userJob,
      userIncome: userIncome ?? this.userIncome,
      isEmployed: isEmployed ?? this.isEmployed,
      image: image ?? this.image,
      score: score ?? this.score
    );
  }

  @override
  List<Object?> get props =>
      [loanValue, loanPeriod, userName, userJob, userIncome, isEmployed, image, score];
}