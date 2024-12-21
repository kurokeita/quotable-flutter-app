import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool centerTitle;

  const CustomAppBar({Key? key, required this.title, this.centerTitle = false})
      : super(key: key);

  @override
  Size get preferredSize => Size.copy(AppBar().preferredSize);

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
        valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
        builder: (context, mode, child) => AppBar(
          title: title,
          centerTitle: centerTitle,
          actions: [
            IconButton(
              icon: AdaptiveTheme.of(context).brightness  == Brightness.dark
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
              onPressed: () =>
                  AdaptiveTheme.of(context).toggleThemeMode(useSystem: false),
            )
          ],
        ));
  }
}
