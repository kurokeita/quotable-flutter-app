import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_app/services/preferences/app_theme_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool centerTitle;
  final BuildContext context;

  const CustomAppBar(
      {Key? key,
      required this.context,
      required this.title,
      this.centerTitle = false})
      : super(key: key);

  @override
  Size get preferredSize => Size.copy(AppBar().preferredSize);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, _, __) => AppBar(
              title: title,
              centerTitle: centerTitle,
              actions: [
                IconButton(
                  icon: context.watch<AppThemeService>().isDarkTheme
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode),
                  onPressed: () async =>
                      Provider.of<AppThemeService>(context, listen: false)
                          .toggleTheme(),
                )
              ],
            ));
  }
}
