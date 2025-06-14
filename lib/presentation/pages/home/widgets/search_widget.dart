import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/color_extension.dart';
import 'package:movie_app/core/themes/theme_border_circular.dart';
import 'package:movie_app/core/themes/theme_padding.dart';

class SearchWidget extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;

  const SearchWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ThemePadding.ph16 + ThemePadding.pb16 + ThemePadding.pt16,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Search here...",
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: HexColor("FAFAFA"),
          contentPadding: ThemePadding.pa16,
          border: OutlineInputBorder(
            borderRadius: ThemeBorderCircular.ba12,
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
