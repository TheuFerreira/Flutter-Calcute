import 'package:flutter_calculadora_rosa/app/pages/default/default_page.dart';
import 'package:flutter_calculadora_rosa/domain/entities/number_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/entities/operation_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/entities/value_field.dart';

abstract class CalculateMultiplyDivideValues {
  List<ValueField> call(List<ValueField> valueFields, double value);
}

class CalculateMultiplyDivideValuesImpl
    implements CalculateMultiplyDivideValues {
  @override
  List<ValueField> call(List<ValueField> valueFields, double value) {
    if (valueFields.length <= 2) {
      return valueFields;
    }

    int startIndex = valueFields.indexWhere(_validate);
    if (startIndex == -1) {
      return valueFields;
    }

    startIndex--;

    int endIndex = valueFields.lastIndexWhere(_validate);
    if (endIndex == valueFields.length - 1) {
      endIndex--;
    } else {
      endIndex++;
    }

    final validList = valueFields.getRange(startIndex, endIndex + 1).toList();

    value = double.parse(validList[0].value);
    int i = 2;
    while (i < validList.length) {
      final operation = validList[i - 1] as OperationValueField;
      final number = validList[i] as NumberValueField;

      if (operation.type == OperationsType.multiply) {
        value *= number.valueNumber;
      } else {
        value /= number.valueNumber;
      }

      i += 2;
    }

    valueFields.removeRange(startIndex, endIndex + 1);
    valueFields.insert(startIndex, NumberValueField(value: value));

    return valueFields;
  }

  bool _validate(ValueField element) {
    final isOperation = element is OperationValueField;
    if (!isOperation) {
      return false;
    }

    final isDivide = element.type == OperationsType.divide;
    final isMultiply = element.type == OperationsType.multiply;

    return isDivide || isMultiply;
  }
}
