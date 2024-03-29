// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_danthocode/features/calculator/controller/calculator_controller.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Shape {
  square,
  circle,
  stadium,
}

class CalculatorButton extends ConsumerStatefulWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double width;
  final Shape shape;

  // ignore: use_key_in_widget_constructors
  const CalculatorButton({
    required this.text,
    this.textColor = Colors.black,
    this.fontSize = 40,
    this.fontWeight = FontWeight.bold,
    this.width = 60,
    this.shape = Shape.square,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends ConsumerState<CalculatorButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.shape == Shape.circle
        ? null
        : BorderRadius.circular(
            widget.shape == Shape.square ? 20 : 30,
          );
    final shape = widget.shape == Shape.circle ? BoxShape.circle : BoxShape.rectangle;
    return Listener(
      onPointerDown: (_) => setState(() {
        isPressed = true;
      }),
      onPointerUp: (_) => setState(() {
        isPressed = false;

        final provider = ref.read(calculationProvider.notifier);
        if (widget.shape == Shape.square) {
          provider.addSign(widget.text);
        } else {
          provider.addNumber(widget.text);
        }
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: shape,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 5,
              color: const Color(0x80FFFFFF),
              inset: isPressed,
            ),
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 5,
              color: const Color(0x80838E9E),
              inset: isPressed,
            ),
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 5,
              color: isPressed ? Colors.transparent : const Color(0xCCFFFFFF),
              inset: true,
            ),
            BoxShadow(
              offset: const Offset(-2, -2),
              blurRadius: 5,
              color: isPressed ? Colors.transparent : const Color(0x66838E9E),
              inset: true,
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
