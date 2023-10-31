import 'package:flutter/material.dart';
import 'package:flutter_danthocode/pages/calculator/calculator_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculationText extends ConsumerWidget {
  const CalculationText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculationNotifier = ref.watch(calculationProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            calculationNotifier.prevData,
            style: TextStyle(fontSize: 32, color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            calculationNotifier.data,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
