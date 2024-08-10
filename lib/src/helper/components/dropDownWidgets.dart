import 'package:dynami_form/main.dart';
import 'package:dynami_form/src/helper/utils/appColors.dart';
import 'package:flutter/material.dart';

Widget dropDownWidgets({
  required hintText,
  required value,
  required List list,
  length,
  bredth,
  hintTextColor,
  required Function(dynamic) onChange,
}) {
  return Container(
    height: height * (bredth ?? 0.06),
    width: width * (length ?? 1),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * 0.01),
        border: Border.all(color: AppColors.blackColor)),
    child: DropdownButton(
      value: value,
      items: List.generate(
        list.length,
        (index) => DropdownMenuItem(
          value: list[index],
          child: Center(
              child: Text(list[index],
                  style: TextStyle(
                      color: AppColors.blackColor, fontSize: height * 0.020))),
        ),
      ),
      hint: Text(hintText,
          style:
              TextStyle(color: AppColors.blackColor, fontSize: height * 0.020)),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.blackColor,
      ),
      dropdownColor: AppColors.whiteColor,
      padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      isExpanded: true,
      underline: const SizedBox(),
      onChanged: (value) => onChange(value),
    ),
  );
}
