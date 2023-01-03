import 'package:mobx/mobx.dart';

part 'value_field.g.dart';

class ValueField = ValueFieldBase with _$ValueField;

abstract class ValueFieldBase with Store {
  @observable
  dynamic value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueFieldBase &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  ValueFieldBase({required this.value /*, required this.type*/});

  @override
  String toString() => "Value: $value | Type:";
}
