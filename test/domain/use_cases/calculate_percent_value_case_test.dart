import 'package:flutter/material.dart';
import 'package:flutter_calculadora_rosa/domain/entities/number_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/entities/operation_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/entities/value_field.dart';
import 'package:flutter_calculadora_rosa/domain/enums/operations_type.dart';
import 'package:flutter_calculadora_rosa/domain/use_cases/calculate_percent_value_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final useCase = CalculatePercentValueCaseImpl();

  test('Enter empty list', () {
    final expected = [NumberValueField(value: 0)];

    List<ValueField> valueFields = [];
    final result = useCase(valueFields);
    expect(result, expected);
  });

  test('Last index is operation', () {
    final expected = [
      NumberValueField(value: 7),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 5),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 0),
    ];

    List<ValueField> valueFields = [
      NumberValueField(value: 7),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 5),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
    ];

    final result = useCase(valueFields);
    expect(result, expected);
  });

  test('Last index is number', () {
    final expected = [
      NumberValueField(value: 7),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 5),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 0.05),
    ];

    List<ValueField> valueFields = [
      NumberValueField(value: 7),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 5),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 5),
    ];

    final result = useCase(valueFields);
    expect(result, expected);
  });
}
