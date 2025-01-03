import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:quotable/ui/views/setting/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ThemeModeSelect extends StackedView<SettingsViewModel> {
  const ThemeModeSelect({super.key});

  @override
  Widget builder(
      BuildContext context, SettingsViewModel viewModel, Widget? child) {
    final AdaptiveThemeMode mode = viewModel.getThemeMode(context);

    return ListTile(
      title: const Text('Theme'),
      trailing: SegmentedButton<AdaptiveThemeMode>(
        showSelectedIcon: false,
        segments: <ButtonSegment<AdaptiveThemeMode>>[
          ButtonSegment(
            value: AdaptiveThemeMode.light,
            icon: Icon(
              Icons.light_mode_rounded,
              color: mode == AdaptiveThemeMode.light
                  ? ColorScheme.of(context).surfaceContainerLow
                  : ColorScheme.of(context).primary,
            ),
          ),
          ButtonSegment(
            value: AdaptiveThemeMode.system,
            icon: Icon(
              Icons.auto_mode,
              color: mode == AdaptiveThemeMode.system
                  ? ColorScheme.of(context).surfaceContainerLow
                  : ColorScheme.of(context).primary,
            ),
          ),
          ButtonSegment(
            value: AdaptiveThemeMode.dark,
            icon: Icon(
              Icons.dark_mode,
              color: mode == AdaptiveThemeMode.dark
                  ? ColorScheme.of(context).surfaceContainerLow
                  : ColorScheme.of(context).primary,
            ),
          ),
        ],
        selected: {mode},
        onSelectionChanged: (Set<AdaptiveThemeMode> newSelection) {
          viewModel.setThemeMode(context, newSelection.first);
        },
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
