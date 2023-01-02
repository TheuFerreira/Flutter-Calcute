import 'package:flutter_calculadora_rosa/app/pages/default/default_page.dart';
import 'package:flutter_calculadora_rosa/domain/entities/value_field.dart';
import 'package:mobx/mobx.dart';

part 'number_value_field.g.dart';

class NumberValueField = NumberValueFieldBase with _$NumberValueField;

abstract class NumberValueFieldBase extends ValueField with Store {
  num get valueNumber => double.parse(value);

  @action
  void addToText(dynamic value) {
    this.value += value.toString();
  }

  @action
  void removeLastText() {
    value = value.toString().substring(0, value.toString().length - 1);
  }

  NumberValueFieldBase({
    required dynamic value,
    required ButtonType type,
  }) : super(value: value.toString());

  @override
  String toString() => "Value: $value";
}
