import 'package:flutter/material.dart';
import 'package:quotable/app/app.locator.dart';
import 'package:quotable/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool centerTitle;
  final _navigationService = locator<NavigationService>();

  CustomAppBar({super.key, required this.title, this.centerTitle = false});

  @override
  Size get preferredSize => Size.copy(AppBar().preferredSize);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return AppBar(
      title: title,
      centerTitle: centerTitle,
      actions: currentRoute != Routes.settingsView
          ? [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: _navigationService.navigateToSettingsView,
              )
            ]
          : null,
    );
  }
}
