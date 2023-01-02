import 'package:flutter/material.dart';
import 'package:flutter_calculadora_rosa/app/pages/default/default_page.dart';

class ActionButtonComponent extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final ButtonType type;
  final dynamic result;
  final void Function(dynamic value, ButtonType type)? onTap;
  const ActionButtonComponent({
    super.key,
    this.text,
    this.icon,
    this.onTap,
    required this.type,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final isText = icon == null;
    return Expanded(
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
