import 'package:flutter/material.dart';
import 'package:flutter_calculadora_rosa/value_field.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_calculadora_rosa/app/pages/default/default_page.dart';

part 'operation_value_field.g.dart';

class OperationValueField = OperationValueFieldBase with _$OperationValueField;

abstract class OperationValueFieldBase extends ValueField with Store {
  @observable
  OperationsType type;

  @action
  void updateIcon(IconData icon) => value = icon;

  @action
  void updateType(type) => this.type = type;

  OperationValueFieldBase({
    required IconData icon,
    required this.type,
  }) : super(value: icon);
}
