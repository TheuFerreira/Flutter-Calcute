// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_value_field.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OperationValueField on OperationValueFieldBase, Store {
  late final _$typeAtom =
      Atom(name: 'OperationValueFieldBase.type', context: context);

  @override
  OperationsType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(OperationsType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$OperationValueFieldBaseActionController =
      ActionController(name: 'OperationValueFieldBase', context: context);

  @override
  void updateIcon(IconData icon) {
    final _$actionInfo = _$OperationValueFieldBaseActionController.startAction(
        name: 'OperationValueFieldBase.updateIcon');
    try {
      return super.updateIcon(icon);
    } finally {
      _$OperationValueFieldBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateType(dynamic type) {
    final _$actionInfo = _$OperationValueFieldBaseActionController.startAction(
        name: 'OperationValueFieldBase.updateType');
    try {
      return super.updateType(type);
    } finally {
      _$OperationValueFieldBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
type: ${type}
    ''';
  }
}
