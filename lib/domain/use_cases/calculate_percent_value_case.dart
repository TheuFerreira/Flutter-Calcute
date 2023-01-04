import 'package:flutter_calculadora_rosa/domain/entities/number_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/entities/operation_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/entities/value_field.dart';

abstract class CalculatePercentValueCase {
  List<ValueField> call(List<ValueField> valueFields);
}

class CalculatePercentValueCaseImpl implements CalculatePercentValueCase {
  @override
  List<ValueField> call(List<ValueField> valueFields) {
    if (valueFields.isEmpty) {
      return [NumberValueField(value: 0)];
    }

    final indexOpration =
        valueFields.lastIndexWhere((element) => element is OperationValueField);
    if (indexOpration == valueFields.length - 1) {
      final numberZero = NumberValueField(value: 0);
      valueFields.add(numberZero);
      return valueFields;
    }

    final numberField = valueFields.last as NumberValueField;
    final percent = double.parse(numberField.value) / 100;

    numberField.updateText(percent);

    return valueFields;
  }
}
