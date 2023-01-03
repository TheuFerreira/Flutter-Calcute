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

  NumberValueFieldBase({required dynamic value})
      : super(value: value.toString());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NumberValueFieldBase &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          valueNumber == other.valueNumber;

  @override
  int get hashCode => value.hashCode ^ valueNumber.hashCode;

  @override
  String toString() => "Value: $value";
}
