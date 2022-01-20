import 'package:flutter/material.dart';
import 'package:nonton_app/theme.dart';

class GenderList extends StatelessWidget {
  final int? gender;
  const GenderList({
    Key? key,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (gender == 0) {
      return Text(
        "-",
        style: whiteTextStyle.copyWith(
          color: whiteColor.withOpacity(0.8),
        ),
      );
    } else if (gender == 1) {
      return Text(
        "Female",
        style: whiteTextStyle.copyWith(
          color: whiteColor.withOpacity(0.8),
        ),
      );
    } else if (gender == 2) {
      return Text(
        "Male",
        style: whiteTextStyle.copyWith(
          color: whiteColor.withOpacity(0.8),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
