import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

sealed class AppTheme {
  // The defined light theme.
  static ThemeData get light {
    ThemeData theme = FlexThemeData.light(
      scheme: FlexScheme.purpleM3,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 1,
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        tintedDisabledControls: true,
        blendOnLevel: 8,
        useM2StyleDividerInM3: true,
        splashType: FlexSplashType.inkSplash,
        defaultRadius: 12.0,
        elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
        elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        toggleButtonsBorderSchemeColor: SchemeColor.primary,
        segmentedButtonSchemeColor: SchemeColor.primary,
        segmentedButtonBorderSchemeColor: SchemeColor.primary,
        unselectedToggleIsColored: true,
        sliderValueTinted: true,
        inputDecoratorSchemeColor: SchemeColor.primary,
        inputDecoratorIsFilled: true,
        inputDecoratorBackgroundAlpha: 31,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: false,
        inputDecoratorFocusedBorderWidth: 1.0,
        inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
        fabUseShape: true,
        fabAlwaysCircular: true,
        fabSchemeColor: SchemeColor.tertiary,
        popupMenuRadius: 8.0,
        popupMenuElevation: 3.0,
        alignedDropdown: true,
        drawerIndicatorRadius: 12.0,
        drawerIndicatorSchemeColor: SchemeColor.primary,
        bottomSheetModalBackgroundColor: SchemeColor.surfaceDim,
        bottomSheetRadius: 20.0,
        bottomNavigationBarMutedUnselectedLabel: false,
        bottomNavigationBarMutedUnselectedIcon: false,
        menuRadius: 8.0,
        menuElevation: 3.0,
        menuBarRadius: 0.0,
        menuBarElevation: 2.0,
        menuBarShadowColor: Color(0x00000000),
        searchBarElevation: 1.0,
        searchViewElevation: 1.0,
        searchUseGlobalShape: true,
        navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
        navigationBarIndicatorSchemeColor: SchemeColor.primary,
        navigationBarIndicatorRadius: 12.0,
        navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
        navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
        navigationRailUseIndicator: true,
        navigationRailIndicatorSchemeColor: SchemeColor.primary,
        navigationRailIndicatorOpacity: 1.00,
        navigationRailIndicatorRadius: 12.0,
        navigationRailBackgroundSchemeColor: SchemeColor.surface,
        navigationRailLabelType: NavigationRailLabelType.all,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
        keepPrimary: true,
      ),
      tones: FlexSchemeVariant.jolly.tones(Brightness.light),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    );

    BottomSheetThemeData bottomSheetTheme = theme.bottomSheetTheme;

    return theme.copyWith(
      bottomSheetTheme: bottomSheetTheme.copyWith(
        clipBehavior: Clip.none,
      ),
    );
  }

  // The defined dark theme.
  static ThemeData get dark {
    ThemeData theme = FlexThemeData.dark(
      scheme: FlexScheme.purpleM3,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 2,
      darkIsTrueBlack: true,
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        tintedDisabledControls: true,
        blendOnLevel: 10,
        blendOnColors: true,
        useM2StyleDividerInM3: true,
        splashType: FlexSplashType.inkSplash,
        adaptiveElevationShadowsBack: FlexAdaptive.all(),
        defaultRadius: 12.0,
        elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
        elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        toggleButtonsBorderSchemeColor: SchemeColor.primary,
        segmentedButtonSchemeColor: SchemeColor.primary,
        segmentedButtonBorderSchemeColor: SchemeColor.primary,
        unselectedToggleIsColored: true,
        sliderValueTinted: true,
        inputDecoratorSchemeColor: SchemeColor.primary,
        inputDecoratorIsFilled: true,
        inputDecoratorBackgroundAlpha: 43,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: false,
        inputDecoratorFocusedBorderWidth: 1.0,
        inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
        fabUseShape: true,
        fabAlwaysCircular: true,
        fabSchemeColor: SchemeColor.tertiary,
        popupMenuRadius: 8.0,
        popupMenuElevation: 3.0,
        alignedDropdown: true,
        drawerIndicatorRadius: 12.0,
        drawerIndicatorSchemeColor: SchemeColor.primary,
        bottomSheetModalBackgroundColor: SchemeColor.transparent,
        bottomSheetRadius: 20.0,
        bottomNavigationBarMutedUnselectedLabel: false,
        bottomNavigationBarMutedUnselectedIcon: false,
        menuRadius: 8.0,
        menuElevation: 3.0,
        menuBarRadius: 0.0,
        menuBarElevation: 2.0,
        menuBarShadowColor: Color(0x00000000),
        searchBarElevation: 1.0,
        searchViewElevation: 1.0,
        searchUseGlobalShape: true,
        navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
        navigationBarIndicatorSchemeColor: SchemeColor.primary,
        navigationBarIndicatorRadius: 12.0,
        navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
        navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
        navigationRailUseIndicator: true,
        navigationRailIndicatorSchemeColor: SchemeColor.primary,
        navigationRailIndicatorOpacity: 1.00,
        navigationRailIndicatorRadius: 12.0,
        navigationRailBackgroundSchemeColor: SchemeColor.surface,
        navigationRailLabelType: NavigationRailLabelType.all,
      ),
      keyColors: const FlexKeyColors(
        useSecondary: true,
        useTertiary: true,
      ),
      tones: FlexSchemeVariant.jolly.tones(Brightness.dark).surfacesUseBW(),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    );

    BottomSheetThemeData bottomSheetTheme = theme.bottomSheetTheme;

    return theme.copyWith(
      bottomSheetTheme: bottomSheetTheme.copyWith(
        clipBehavior: Clip.none,
      ),
    );
  }
}
