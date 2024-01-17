import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  const SearchBar({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: 'Search Card',
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
