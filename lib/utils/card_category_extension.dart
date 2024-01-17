import 'package:flutter_danthocode/models/gift_card/gift_card_model.dart';

extension CardCategoryExtension on CardCategory {
  String capitalName() => name[0].toUpperCase() + name.substring(1, name.length).toLowerCase();
}
