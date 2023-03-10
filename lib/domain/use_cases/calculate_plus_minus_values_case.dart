import 'package:flutter_calculadora_rosa/domain/entities/operation_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/entities/value_field.dart';
import 'package:flutter_calculadora_rosa/domain/enums/operations_type.dart';

abstract class CalculatePlusMinusValuesCase {
  double call(List<ValueFieldBase> valueFields, double value);
}

class CalculatePlusMinusValuesCaseImpl implements CalculatePlusMinusValuesCase {
  @override
  double call(List<ValueFieldBase> valueFields, double value) {
    int i = 2;

    value = double.parse(valueFields[0].value);
    while (i < valueFields.length) {
      final operation = valueFields[i - 1] as OperationValueField;
      final number = valueFields[i];

      if (operation.type == OperationsType.plus) {
        value += double.parse(number.value);
      } else {
        value -= double.parse(number.value);
      }

      i += 2;
    }

    return value;
  }
}
