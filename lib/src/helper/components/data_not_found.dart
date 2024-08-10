import 'package:dynami_form/main.dart';
import 'package:dynami_form/src/helper/utils/appColors.dart';
import 'package:flutter/material.dart';

class DataNotFound extends StatelessWidget {
  const DataNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage('assets/image/no_data_available.png'),
            height: height / 6,
            width: width / 2,
          ),
          Text(
            'Data Not Found\nSomething went wrong',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.blackColor),
          )
        ],
      ),
    );
  }
}
