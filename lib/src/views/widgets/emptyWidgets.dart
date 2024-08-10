import 'package:dynami_form/main.dart';
import 'package:dynami_form/src/helper/utils/appColors.dart';
import 'package:flutter/material.dart';

Widget emptyField() {
  return Container(
    height: height * 0.05,
    padding: EdgeInsets.all(width * 0.02),
    width: width,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.blackColor),
        borderRadius: BorderRadius.circular(width * 0.02)),
    child: const Text('Something went wrong'),
  );
}
