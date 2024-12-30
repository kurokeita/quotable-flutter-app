import 'package:flutter/material.dart';
import 'package:quotable/ui/components/layout/app_bar.dart';
import 'package:quotable/ui/views/setting/app_reset.component.dart';
import 'package:quotable/ui/views/setting/theme_mode_select.component.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('Settings'), centerTitle: true),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: ListView(
          children: [
            ThemeModeSelect(),
            AppReset(),
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
