import 'package:flutter/material.dart';
import 'package:flutter_danthocode/models/gift_card/gift_card_model.dart';
import 'package:flutter_danthocode/providers/selected_category_provider.dart';
import 'package:flutter_danthocode/widgets/custom_chip.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/card_category_extension.dart';

class CategoryFilter extends ConsumerWidget {
  const CategoryFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return SizedBox(
      height: 30,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ...CardCategory.values.map(
            (category) => CustomChip(
              label: category.capitalName(),
              isSelected: selectedCategory == category,
              onTap: () {
                print('object');
                ref.read(selectedCategoryProvider.notifier).setSelect(selectedCategory);
              },
            ),
          ),
        ],
      ),
    );
  }
}
