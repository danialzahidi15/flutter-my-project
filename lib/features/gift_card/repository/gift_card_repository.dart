import 'package:flutter_danthocode/models/gift_card/gift_card_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'gift_card_repository.g.dart';

@riverpod
GiftCardRepository giftCardRepository(GiftCardRepositoryRef ref) => GiftCardRepository();

class GiftCardRepository {
  Future<List<GiftCardModel>> getAllGiftCards() async {
    return Future.delayed(const Duration(milliseconds: 300), () {
      return GiftCardModel.sampleCards;
    });
  }

  Future<GiftCardModel> getGiftCard(int cardId) {
    return Future.delayed(const Duration(milliseconds: 300), () {
      return GiftCardModel.sampleCards.where((card) => card.id == cardId).first;
    });
  }
}
