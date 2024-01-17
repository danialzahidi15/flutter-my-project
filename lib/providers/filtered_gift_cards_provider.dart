import 'package:flutter_danthocode/models/gift_card/gift_card_model.dart';
import 'package:flutter_danthocode/providers/search_query_provider.dart';
import 'package:flutter_danthocode/providers/selected_category_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../features/gift_card/repository/gift_card_repository.dart';

part 'filtered_gift_cards_provider.g.dart';

@riverpod
Future<List<GiftCardModel>> filteredGiftCards(FilteredGiftCardsRef ref) async {
  final giftCardRepository = ref.watch(giftCardRepositoryProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final searchQuery = ref.watch(searchQueryProvider);

  var getAllGiftCards = await giftCardRepository.getAllGiftCards();

  if (selectedCategory != null) {
    return getAllGiftCards.where((card) {
      return card.category.any(
        (category) => category == selectedCategory,
      );
    }).toList();
  }

  if (searchQuery.trim().isNotEmpty) {
    return getAllGiftCards.where((card) {
      return card.name.toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
    }).toList();
  }

  return getAllGiftCards;
}
