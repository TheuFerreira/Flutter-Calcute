import 'package:flutter_calculadora_rosa/app/pages/default/default_page.dart';
import 'package:flutter_calculadora_rosa/operation_value_field.dart';
import 'package:flutter_calculadora_rosa/value_field.dart';

abstract class CalculatePlusMinusValuesCase {
  double call(List<ValueFieldBase> valueFields, double value);
}

class CalculatePlusMinusValuesCaseImpl implements CalculatePlusMinusValuesCase {
  @override
  double call(List<ValueFieldBase> valueFields, double value) {
    int i = 2;
    while (i < valueFields.length) {
      final operation = valueFields[i - 1] as OperationValueField;
      final number = valueFields[i];

      switch (operation.type) {
        case OperationsType.plus:
          value += double.parse(number.value);
          break;
        case OperationsType.minus:
          value -= double.parse(number.value);
          break;
      }

      i += 2;
    }

    return value;
  }
}
