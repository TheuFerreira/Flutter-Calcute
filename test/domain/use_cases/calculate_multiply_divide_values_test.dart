import 'package:flutter/material.dart';
import 'package:flutter_calculadora_rosa/domain/entities/number_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/entities/operation_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/entities/value_field.dart';
import 'package:flutter_calculadora_rosa/domain/enums/operations_type.dart';
import 'package:flutter_calculadora_rosa/domain/use_cases/calculate_multiply_divide_values.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final useCase = CalculateMultiplyDivideValuesImpl();

  test('Test list of Multiply and Divide values', () {
    final fieldValues = [
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 5),
      OperationValueField(icon: Icons.abc, type: OperationsType.divide),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 8),
    ];

    List<ValueField> matcher = [NumberValueField(value: 40.0)];
    final value = useCase(fieldValues, 1);
    expect(value, matcher);
  });

  test('Test list of Multiply and Divide values without last number', () {
    final fieldValues = [
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 5),
      OperationValueField(icon: Icons.abc, type: OperationsType.divide),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
    ];

    final matcher = [
      NumberValueField(value: 5.0),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
    ];
    final value = useCase(fieldValues, 1);
    expect(value, matcher);
  });

  test('Test list of Multiply and Divide values with Sum and Minus', () {
    final fieldValues = [
      NumberValueField(value: 10),
      OperationValueField(icon: Icons.abc, type: OperationsType.plus),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.multiply),
      NumberValueField(value: 5),
      OperationValueField(icon: Icons.abc, type: OperationsType.divide),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.divide),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.minus),
      NumberValueField(value: -5),
    ];

    List<ValueField> matcher = [
      NumberValueField(value: 10),
      OperationValueField(icon: Icons.abc, type: OperationsType.plus),
      NumberValueField(value: 2.5),
      OperationValueField(icon: Icons.abc, type: OperationsType.minus),
      NumberValueField(value: -5),
    ];
    final value = useCase(fieldValues, 1);
    expect(value, matcher);
  });

  test('Test list of Multiply and Divide values with simply list', () {
    final fieldValues = [
      NumberValueField(value: 10),
      OperationValueField(icon: Icons.abc, type: OperationsType.plus),
    ];

    List<ValueField> matcher = [
      NumberValueField(value: 10),
      OperationValueField(icon: Icons.abc, type: OperationsType.plus),
    ];
    final value = useCase(fieldValues, 1);
    expect(value, matcher);
  });

  test('Test list of Multiply and Divide values without valid values', () {
    final fieldValues = [
      NumberValueField(value: 10),
      OperationValueField(icon: Icons.abc, type: OperationsType.plus),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.minus),
      NumberValueField(value: 5),
      OperationValueField(icon: Icons.abc, type: OperationsType.plus),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.plus),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.minus),
      NumberValueField(value: -5),
    ];

    List<ValueField> matcher = [
      NumberValueField(value: 10),
      OperationValueField(icon: Icons.abc, type: OperationsType.plus),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.minus),
      NumberValueField(value: 5),
      OperationValueField(icon: Icons.abc, type: OperationsType.plus),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.plus),
      NumberValueField(value: 2),
      OperationValueField(icon: Icons.abc, type: OperationsType.minus),
      NumberValueField(value: -5),
    ];
    final value = useCase(fieldValues, 1);
    expect(value, matcher);
  });
}
