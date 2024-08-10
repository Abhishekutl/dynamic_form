import 'package:dynami_form/main.dart';
import 'package:flutter/cupertino.dart';

Widget verticalSpace(hght){
  return SizedBox(
    height: height*(hght??1),
  );
}

Widget horizontalSpace(wdth){
  return SizedBox(
    width: width*(wdth??1),
  );
}