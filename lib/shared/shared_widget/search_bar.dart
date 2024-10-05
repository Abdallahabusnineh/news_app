import 'package:flutter/material.dart';

import '../core/utils/app_assets.dart';
import '../core/utils/font_style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.isHasLeading});
final bool isHasLeading;
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search ',
      textStyle:  WidgetStatePropertyAll(
        AppFontStyle.fontSize14W400ColorExtraLightPurple(),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      leading:  isHasLeading?
       Image.asset(AppAssets.iconSearch):null,
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      trailing: List.filled(1, Image.asset(isHasLeading?AppAssets.iconFilters:AppAssets.iconSearch),
          growable: true),
    );
  }
}
