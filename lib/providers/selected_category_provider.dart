import 'package:flutter_danthocode/models/gift_card/gift_card_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_category_provider.g.dart';

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  CardCategory? build() {
    return null;
  }

  void setSelect(CardCategory? selectedCategory) async {
    if (state == selectedCategory) {
      state = null;
    } else {
      state = selectedCategory;
    }
  }
}
