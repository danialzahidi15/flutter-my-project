import 'package:flutter/material.dart';
import 'package:flutter_danthocode/models/gift_card/gift_card_model.dart';

class CustomGiftCard extends StatelessWidget {
  final GiftCardModel card;
  final double width;
  final int? value;
  final bool showLabel;
  final bool showValue;
  const CustomGiftCard({
    super.key,
    required this.card,
    required this.width,
    this.value,
    this.showLabel = true,
    this.showValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Image.asset(
                card.thumbnailPath,
                fit: BoxFit.cover,
              ),
            ),
            if (showLabel) ...[
              const SizedBox(height: 10),
              Text(card.name),
            ],
          ],
        ),
        if (showValue)
          Positioned(
            bottom: 10,
            right: 10,
            child: Text('RM$value'),
          ),
      ],
    );
  }
}
