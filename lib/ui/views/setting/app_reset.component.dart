import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:quotable/ui/views/setting/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AppReset extends StackedView<SettingsViewModel> {
  const AppReset({super.key});

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return ListTile(
      title: const Text('Reset app'),
      onTap: () => _showResetConfirmationDialog(context, viewModel),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();

  void _showResetConfirmationDialog(
      BuildContext context, SettingsViewModel viewModel) {
    NAlertDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      title: const Text('Reset app?'),
      content: const Text('Are you sure you want to reset the app?'),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          onPressed: viewModel.resetApp,
          child: const Text('Reset'),
        ),
      ],
    ).show(context);
  }
}
