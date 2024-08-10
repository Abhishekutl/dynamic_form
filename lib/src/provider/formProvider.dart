import 'dart:convert';

import 'package:dynami_form/src/model/formModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormProvider extends ChangeNotifier {
  bool loading = true;
  List<FormModel> formList = [];
  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  bool getLoading() => loading;

  String jsonResponse = '''
  [
    {
      "field_name": "f1",
      "widget": "dropdown",
      "valid_values": ["A", "B"]
    },
    {"field_name": "f2", "widget": "textfield", "visible": "f1=='A'"},
    {"field_name": "f3", "widget": "textfield", "visible": "f1=='A'"},
    {"field_name": "f4", "widget": "textfield", "visible": "f1=='A'"},
    {"field_name": "f5", "widget": "textfield", "visible": "f1=='B'"},
    {"field_name": "f6", "widget": "textfield", "visible": "f1=='B'"},
    {
      "field_name": "f7",
      "widget": "dropdown",
      "valid_values": ["A", "B", "C", "D"]
    }
  ]
  ''';


  getFormData() {
    setLoading(true);
    List<dynamic> jsonList = jsonDecode(jsonResponse);
     formList = jsonList.map((json) => FormModel.fromJson(json)).toList();
     setLoading(false);
     notifyListeners();
    // Now you can access formList which is of type List<FormModel>
    for (var form in formList) {
      print('Field Name: ${form.fieldName}, Widget: ${form.widget}');
      if (form.validValues != null) {
        print('Valid Values: ${form.validValues}');
      }
      if (form.visible != null) {
        print('Visible: ${form.visible}');
      }
      print('---');
    }
  }



}

final formProvider = ChangeNotifierProvider((ref) {
  FormProvider ob = FormProvider();
  return ob;
});
