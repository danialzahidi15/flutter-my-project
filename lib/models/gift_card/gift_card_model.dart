import 'package:flutter_danthocode/constant/card_constant.dart';

enum CardCategory {
  birhtday,
  christmas,
  general,
  congratulation,
}

class GiftCardModel {
  final int id;
  final String name;
  final String thumbnailPath;
  final List<CardCategory> category;
  GiftCardModel({
    required this.id,
    required this.name,
    required this.thumbnailPath,
    required this.category,
  });

  static List<GiftCardModel> sampleCards = [
    GiftCardModel(
      id: 1,
      name: 'Chrismast Doge',
      thumbnailPath: CardConstants.dogChristmas,
      category: [
        CardCategory.general,
        CardCategory.christmas,
      ],
    ),
    GiftCardModel(
      id: 2,
      name: 'Flower Bouquet',
      thumbnailPath: CardConstants.flower,
      category: [
        CardCategory.general,
        CardCategory.christmas,
        CardCategory.congratulation,
      ],
    ),
    GiftCardModel(
      id: 3,
      name: 'Ho Ho Ho',
      thumbnailPath: CardConstants.hohoho,
      category: [CardCategory.general, CardCategory.christmas],
    ),
    GiftCardModel(
      id: 4,
      name: 'Choco Cake',
      thumbnailPath: CardConstants.cakeBirthday,
      category: [CardCategory.general, CardCategory.christmas],
    ),
    GiftCardModel(
      id: 5,
      name: 'Happy Birthday',
      thumbnailPath: CardConstants.happyBirthday,
      category: [CardCategory.general, CardCategory.birhtday],
    ),
    GiftCardModel(
      id: 6,
      name: 'Giving Season',
      thumbnailPath: CardConstants.giftChristmas,
      category: [CardCategory.general, CardCategory.christmas],
    ),
    GiftCardModel(
      id: 7,
      name: 'Birhday Gift',
      thumbnailPath: CardConstants.giftHappy,
      category: [CardCategory.general, CardCategory.christmas],
    ),
    GiftCardModel(
      id: 8,
      name: 'Holly Jolly Socks',
      thumbnailPath: CardConstants.sockChristmas,
      category: [CardCategory.general, CardCategory.christmas],
    ),
  ];
}
