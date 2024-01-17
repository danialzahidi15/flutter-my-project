import 'package:flutter/material.dart';
import 'package:flutter_danthocode/models/gift_card/gift_card_model.dart';
import 'package:flutter_danthocode/providers/filtered_gift_cards_provider.dart';
import 'package:flutter_danthocode/features/gift_card/repository/gift_card_repository.dart';
import 'package:flutter_danthocode/widgets/custom_gift_card.dart';
import 'package:flutter_danthocode/widgets/loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GiftCardGrid extends ConsumerWidget {
  const GiftCardGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final giftCards = ref.watch(filteredGiftCardsProvider);

    return giftCards.when(
      loading: () => const Loading(),
      data: (cards) {
        return SizedBox(
          height: size.height * 0.65,
          child: GridView.builder(
            itemCount: cards.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final card = cards[index];
              return Center(
                child: CustomGiftCard(
                  card: card,
                  width: size.width * 0.425,
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text(
          'Failed to fetch cards',
        ),
      ),
    );
  }
}
