import 'package:mobx/mobx.dart';

part 'value_field.g.dart';

class ValueField = ValueFieldBase with _$ValueField;

abstract class ValueFieldBase with Store {
  @observable
  dynamic value;

  ValueFieldBase({required this.value /*, required this.type*/});

  @override
  String toString() => "Value: $value | Type:";
}
