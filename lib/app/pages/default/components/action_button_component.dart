import 'package:flutter/material.dart';
import 'package:flutter_calculadora_rosa/domain/enums/button_type.dart';

class ActionButtonComponent extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final ButtonType type;
  final dynamic result;
  final int flex;
  final void Function(dynamic value, ButtonType type)? onTap;
  const ActionButtonComponent({
    super.key,
    this.text,
    this.icon,
    this.onTap,
    required this.type,
    required this.result,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    final isText = icon == null;
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => onTap!(result, type),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFFDB91A0),
            foregroundColor: const Color(0xFFFFCFD9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: isText ? _textWidget() : _iconWiget(),
        ),
      ),
    );
  }

  Widget _textWidget() {
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 30,
      ),
    );
  }

  Widget _iconWiget() {
    return Icon(
      icon,
      size: 30,
    );
  }
}
