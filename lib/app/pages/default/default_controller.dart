import 'package:flutter_calculadora_rosa/app/pages/default/default_page.dart';
import 'package:flutter_calculadora_rosa/domain/use_cases/calculate_plus_minus_values_case.dart';
import 'package:flutter_calculadora_rosa/number_value_field.dart';
import 'package:flutter_calculadora_rosa/operation_value_field.dart';
import 'package:flutter_calculadora_rosa/value_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

part 'default_controller.g.dart';

class DefaultController = DefaultControllerBase with _$DefaultController;

abstract class DefaultControllerBase with Store {
  @observable
  String resultText = '';

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
    }

    _process();
  }

  _processNumber(num value, ButtonType type) {
    if (valueFields.isEmpty) {
      final valueField = NumberValueField(value: value, type: type);
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

    final valueField = NumberValueField(value: value, type: type);
    valueFields.add(valueField);
  }

  _processComma(String value, ButtonType type) {
    if (valueFields.isEmpty) {
      final valueField = NumberValueField(value: '0.', type: type);
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
      final valueField = NumberValueField(value: '0.', type: type);
      valueFields.add(valueField);
    }
  }

  _processOperation(OperationsType value, ButtonType type) {
    if (valueFields.isEmpty) {
      final valueField = NumberValueField(value: '0', type: ButtonType.number);
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
        operationField.updateIcon(FontAwesomeIcons.plus);
        break;
      case OperationsType.minus:
        operationField.updateIcon(FontAwesomeIcons.minus);
        break;
    }
  }

  _addOperation(OperationsType value) {
    switch (value) {
      case OperationsType.plus:
        final valueField = OperationValueField(
          icon: FontAwesomeIcons.plus,
          type: value,
        );
        valueFields.add(valueField);
        break;
      case OperationsType.minus:
        final valueField = OperationValueField(
          icon: FontAwesomeIcons.minus,
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
    final valueField = NumberValueField(
      value: resultText,
      type: ButtonType.number,
    );
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

    final calculatePlusMinusValuesCase = CalculatePlusMinusValuesCaseImpl();
    value = calculatePlusMinusValuesCase(valueFields.toList(), value);
    resultText = value.toString();
  }
}