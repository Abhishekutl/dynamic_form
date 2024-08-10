import 'package:dynami_form/main.dart';
import 'package:dynami_form/src/helper/components/data_not_found.dart';
import 'package:dynami_form/src/helper/components/dropDownWidgets.dart';
import 'package:dynami_form/src/helper/components/loaderWidgets.dart';
import 'package:dynami_form/src/helper/utils/appColors.dart';
import 'package:dynami_form/src/helper/utils/dimentions.dart';
import 'package:dynami_form/src/provider/formProvider.dart';
import 'package:dynami_form/src/views/widgets/appBarWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../helper/components/textFieldWidgets.dart';
import 'widgets/emptyWidgets.dart';

class FormView extends ConsumerStatefulWidget {
  const FormView({super.key});

  @override
  ConsumerState<FormView> createState() => _FormViewState();
}

class _FormViewState extends ConsumerState<FormView> {
  @override
  Widget build(BuildContext context) {
    var read = ref.read(formProvider);
    var watch = ref.watch(formProvider);
    return Scaffold(
        appBar: appBarWidgets(),
        body: watch.getLoading()
            ? const LoaderWidgets()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(0.01),
                    Text(
                      'Please fill this dynamic form',
                      style: TextStyle(
                          color: AppColors.blackColor, fontSize: height * 0.02),
                    ),
                    verticalSpace(0.01),
                    watch.formList.isEmpty
                        ? const DataNotFound()
                        : Expanded(
                            child: ListView.builder(
                                itemCount: read.formList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        read.formList[index].fieldName ?? '',
                                        style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize: height * 0.022),
                                      ),
                                      watch.formList[index].widget ==
                                              'textfield'
                                          ? CustomTextField(
                                              hintText: watch.formList[index]
                                                      .visible ??
                                                  '')
                                          : watch.formList[index].widget ==
                                                  'dropdown'
                                              ? dropDownWidgets(
                                                  hintText: watch
                                                      .formList[index]
                                                      .fieldName,
                                                  value: null,
                                                  list: watch.formList[index]
                                                          .validValues ??
                                                      [],
                                                  onChange: (value) {},
                                                )
                                              :  emptyField(),
                                      verticalSpace(0.01)
                                    ],
                                  );
                                }))
                  ],
                ),
              ));
  }

  @override
  void initState() {
    Future.microtask(() {
      ref.read(formProvider).getFormData();
    });
    super.initState();
  }
}
