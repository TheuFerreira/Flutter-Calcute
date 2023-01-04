import 'package:flutter/material.dart';
import 'package:flutter_calculadora_rosa/app/pages/default/components/action_button_component.dart';
import 'package:flutter_calculadora_rosa/app/pages/default/default_controller.dart';
import 'package:flutter_calculadora_rosa/app/utils/default_icons.dart';
import 'package:flutter_calculadora_rosa/domain/entities/number_value_field.dart';
import 'package:flutter_calculadora_rosa/domain/enums/button_type.dart';
import 'package:flutter_calculadora_rosa/domain/enums/operations_type.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  final controller = DefaultController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8C5B65),
      body: Column(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFD4A7B0),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: SafeArea(
                child: Observer(builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SingleChildScrollView(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        child: Observer(
                          builder: (context) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: controller.valueFields.map(
                                (valueField) {
                                  if (valueField is NumberValueField) {
                                    return Text(
                                      valueField.value,
                                      style: const TextStyle(
                                        fontSize: 50,
                                        color: Color(0xFF6B4950),
                                      ),
                                    );
                                  }

                                  return Icon(
                                    valueField.value,
                                    size: 38,
                                    color: const Color(0xFF6B4950),
                                  );
                                },
                              ).toList(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        controller.resultText,
                        style: const TextStyle(
                          color: Color(0xCC6B4950),
                          fontSize: 42,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ActionButtonComponent(
                          text: 'AC',
                          type: ButtonType.clear,
                          result: null,
                          onTap: controller.onTapButton,
                          flex: 2,
                        ),
                        ActionButtonComponent(
                          icon: FontAwesomeIcons.percent,
                          type: ButtonType.percent,
                          result: null,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          icon: divideIcon,
                          type: ButtonType.operation,
                          result: OperationsType.divide,
                          onTap: controller.onTapButton,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ActionButtonComponent(
                          text: '7',
                          type: ButtonType.number,
                          result: 7,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          text: '8',
                          type: ButtonType.number,
                          result: 8,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          text: '9',
                          type: ButtonType.number,
                          result: 9,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          icon: multiplyIcon,
                          type: ButtonType.operation,
                          result: OperationsType.multiply,
                          onTap: controller.onTapButton,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ActionButtonComponent(
                          text: '4',
                          type: ButtonType.number,
                          result: 4,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          text: '5',
                          type: ButtonType.number,
                          result: 5,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          text: '6',
                          type: ButtonType.number,
                          result: 6,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          icon: minusIcon,
                          type: ButtonType.operation,
                          result: OperationsType.minus,
                          onTap: controller.onTapButton,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ActionButtonComponent(
                          text: '1',
                          type: ButtonType.number,
                          result: 1,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          text: '2',
                          type: ButtonType.number,
                          result: 2,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          text: '3',
                          type: ButtonType.number,
                          result: 3,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          icon: plusIcon,
                          type: ButtonType.operation,
                          result: OperationsType.plus,
                          onTap: controller.onTapButton,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ActionButtonComponent(
                          text: '0',
                          type: ButtonType.number,
                          result: 0,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          text: ',',
                          type: ButtonType.comma,
                          result: ',',
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          icon: FontAwesomeIcons.deleteLeft,
                          type: ButtonType.delete,
                          result: null,
                          onTap: controller.onTapButton,
                        ),
                        ActionButtonComponent(
                          icon: FontAwesomeIcons.equals,
                          type: ButtonType.finish,
                          result: null,
                          onTap: controller.onTapButton,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
