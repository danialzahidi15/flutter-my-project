import 'package:flutter/material.dart';
import 'package:flutter_danthocode/providers/search_query_provider.dart';
import 'package:flutter_danthocode/widgets/category_filter.dart';
import 'package:flutter_danthocode/widgets/gift_card_grid.dart';
import 'package:flutter_danthocode/widgets/search_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/custom_bottom_nav_bar.dart';

class GiftCardScreen extends ConsumerWidget {
  const GiftCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SearchBar(
              onChanged: ref.read(searchQueryProvider.notifier).onChange,
            ),
            const SizedBox(height: 20),
            const CategoryFilter(),
            const SizedBox(height: 20),
            const GiftCardGrid(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        index: 0,
      ),
    );
  }
}
