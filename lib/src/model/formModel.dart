class FormModel {
  String? fieldName;
  String? widget;
  String? visible;
  List<String>? validValues;

  FormModel({this.fieldName, this.widget, this.visible, this.validValues});

  FormModel.fromJson(Map<String, dynamic> json) {
    fieldName = json['field_name'];
    widget = json['widget'];
    visible = json['visible'];
    validValues = json['valid_values'] != null
        ? List<String>.from(json['valid_values'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['field_name'] = fieldName;
    data['widget'] = widget;
    data['visible'] = visible;
    data['valid_values'] = validValues;
    return data;
  }
}
