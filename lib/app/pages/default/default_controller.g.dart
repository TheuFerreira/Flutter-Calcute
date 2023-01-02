// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DefaultController on DefaultControllerBase, Store {
  late final _$resultTextAtom =
      Atom(name: 'DefaultControllerBase.resultText', context: context);

  @override
  String get resultText {
    _$resultTextAtom.reportRead();
    return super.resultText;
  }

  @override
  set resultText(String value) {
    _$resultTextAtom.reportWrite(value, super.resultText, () {
      super.resultText = value;
    });
  }

  late final _$valueFieldsAtom =
      Atom(name: 'DefaultControllerBase.valueFields', context: context);

  @override
  ObservableList<ValueField> get valueFields {
    _$valueFieldsAtom.reportRead();
    return super.valueFields;
  }

  @override
  set valueFields(ObservableList<ValueField> value) {
    _$valueFieldsAtom.reportWrite(value, super.valueFields, () {
      super.valueFields = value;
    });
  }

  late final _$DefaultControllerBaseActionController =
      ActionController(name: 'DefaultControllerBase', context: context);

  @override
  void onTapButton(dynamic value, ButtonType type) {
    final _$actionInfo = _$DefaultControllerBaseActionController.startAction(
        name: 'DefaultControllerBase.onTapButton');
    try {
      return super.onTapButton(value, type);
    } finally {
      _$DefaultControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
resultText: ${resultText},
valueFields: ${valueFields}
    ''';
  }
}
