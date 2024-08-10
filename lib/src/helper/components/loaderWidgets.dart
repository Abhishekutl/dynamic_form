import 'package:dynami_form/src/helper/utils/appColors.dart';
import 'package:flutter/material.dart';

class LoaderWidgets extends StatelessWidget {
  const LoaderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color: AppColors.blackColor,
        backgroundColor: AppColors.whiteColor,
      ),
    );
  }
}
