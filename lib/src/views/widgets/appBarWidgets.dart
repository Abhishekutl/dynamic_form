import 'package:dynami_form/src/helper/utils/appColors.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

AppBar appBarWidgets(){
  return AppBar(
    title: Text('Dynamic Form',
        style: TextStyle(
            color: AppColors.blackColor,
            fontSize: height * 0.02,
            fontWeight: FontWeight.bold)),
    centerTitle: true,
  );
}