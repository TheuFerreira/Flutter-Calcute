import 'package:flutter_calculadora_rosa/app/utils/default_icons.dart';
import 'package:flutter_calculadora_rosa/domain/entities/number_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/entities/operation_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/entities/value_field.dart';
import 'package:flutter_calculadora_rosa/domain/enums/button_type.dart';
import 'package:flutter_calculadora_rosa/domain/enums/operations_type.dart';
import 'package:flutter_calculadora_rosa/domain/use_cases/calculate_multiply_divide_values.dart';
import 'package:flutter_calculadora_rosa/domain/use_cases/calculate_percent_value_case.dart';
import 'package:flutter_calculadora_rosa/domain/use_cases/calculate_plus_minus_values_case.dart';
import 'package:mobx/mobx.dart';

part 'default_controller.g.dart';

class DefaultController = DefaultControllerBase with _$DefaultController;

abstract class DefaultControllerBase with Store {
  @observable
  String resultText = '0';

  @observable
  ObservableList<ValueField> valueFields = ObservableList();

  @action
  void onTapButton(dynamic value, ButtonType type) {
    if (type == ButtonType.number) {
      _processNumber(value, type);
    } else if (type == ButtonType.comma) {
      _processComma(value, type);
    } else if (type == ButtonType.operation) {
      _processOperation(value, type);
    } else if (type == ButtonType.clear) {
      _processClear();
    } else if (type == ButtonType.delete) {
      _processDelete();
    } else if (type == ButtonType.finish) {
      _processFinish();
    } else if (type == ButtonType.percent) {
      final newValueFields =
          CalculatePercentValueCaseImpl()(valueFields.toList());
      valueFields.clear();
      valueFields.addAll(newValueFields);
    }

    _process();
  }

  _processNumber(num value, ButtonType type) {
    if (valueFields.isEmpty) {
      final valueField = NumberValueField(value: value);
      valueFields.add(valueField);
      return;
    }

    if (valueFields.last is NumberValueField) {
      final numberField = valueFields.last as NumberValueField;
      if (numberField.value == '0') {
        numberField.removeLastText();
      }

      numberField.addToText(value);
      return;
    }

    final valueField = NumberValueField(value: value);
    valueFields.add(valueField);
  }

  _processComma(String value, ButtonType type) {
    if (valueFields.isEmpty) {
      final valueField = NumberValueField(value: '0.');
      valueFields.add(valueField);
      return;
    }

    final valueField = valueFields.last;
    if (valueField is NumberValueField) {
      final containsComma = valueField.value.contains('.');
      if (!containsComma) {
        valueField.addToText('.');
      }
      return;
    }

    if (type != ButtonType.number) {
      final valueField = NumberValueField(value: '0.');
      valueFields.add(valueField);
    }
  }

  _processOperation(OperationsType value, ButtonType type) {
    if (valueFields.isEmpty) {
      final valueField = NumberValueField(value: '0');
      valueFields.add(valueField);

      _addOperation(value);
      return;
    }

    if (valueFields.last is NumberValueField) {
      _addOperation(value);
      return;
    }

    final operationField = valueFields.last as OperationValueField;
    operationField.updateType(value);
    switch (value) {
      case OperationsType.plus:
        operationField.updateIcon(plusIcon);
        break;
      case OperationsType.minus:
        operationField.updateIcon(minusIcon);
        break;
      case OperationsType.multiply:
        operationField.updateIcon(multiplyIcon);
        break;
      case OperationsType.divide:
        operationField.updateIcon(divideIcon);
        break;
    }
  }

  _addOperation(OperationsType value) {
    switch (value) {
      case OperationsType.plus:
        final valueField = OperationValueField(
          icon: plusIcon,
          type: value,
        );
        valueFields.add(valueField);
        break;
      case OperationsType.minus:
        final valueField = OperationValueField(
          icon: minusIcon,
          type: value,
        );
        valueFields.add(valueField);
        break;
      case OperationsType.multiply:
        final valueField = OperationValueField(
          icon: multiplyIcon,
          type: value,
        );
        valueFields.add(valueField);
        break;
      case OperationsType.divide:
        final valueField = OperationValueField(
          icon: divideIcon,
          type: value,
        );
        valueFields.add(valueField);
        break;
    }
  }

  _processClear() {
    valueFields.clear();
  }

  _processDelete() {
    if (valueFields.isEmpty) {
      return;
    }

    final lastValue = valueFields.last;
    if (lastValue is OperationValueField) {
      valueFields.removeAt(valueFields.length - 1);
      return;
    }

    final numberField = valueFields.last as NumberValueField;
    numberField.removeLastText();
    if (numberField.value.isEmpty) {
      valueFields.removeAt(valueFields.length - 1);
    }
  }

  _processFinish() {
    valueFields.clear();
    final valueField = NumberValueField(value: resultText);
    valueFields.add(valueField);
  }

  void _process() {
    if (valueFields.isEmpty) {
      resultText = '0';
      return;
    }

    double value = double.parse(valueFields[0].value);
    if (valueFields.length == 1) {
      resultText = value.toString();
      return;
    }

    final calculateMultiplyDivideValues = CalculateMultiplyDivideValuesImpl();
    final values = calculateMultiplyDivideValues(valueFields.toList(), value);

    final calculatePlusMinusValuesCase = CalculatePlusMinusValuesCaseImpl();
    value = calculatePlusMinusValuesCase(values, value);
    resultText = value.toString();
  }
}
