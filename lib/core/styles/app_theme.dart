import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  const AppTheme._();

  /// Light theme
  static ThemeData light() {
    final colorScheme = ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimaryLight,
      surface: AppColors.whiteSoft,
      onSurface: AppColors.backgroundDark,
      secondary: AppColors.primary.withValues(alpha: .85),
      onSecondary: AppColors.whiteSoft,
      tertiary: AppColors.primary.withValues(alpha: .65),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: AppTypography.lightTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.lightTextTheme().titleLarge,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.whiteSoft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: AppTypography.lightTextTheme().titleMedium,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.whiteSoft,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: AppColors.primary.withValues(alpha: .3), width: 1.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: AppColors.primary.withValues(alpha: .25), width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.6),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.primary.withValues(alpha: .1),
        selectedColor: AppColors.primary,
        labelStyle: AppTypography.lightTextTheme().labelMedium!,
        secondaryLabelStyle: AppTypography.lightTextTheme().labelMedium!,
        side: BorderSide(color: AppColors.primary.withValues(alpha: .3)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      cardTheme: CardThemeData(
        color: AppColors.whiteSoft,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: const EdgeInsets.all(12),
      ),
      iconTheme: const IconThemeData(color: AppColors.primary),
    );
  }

  /// Dark theme
  static ThemeData dark() {
    final colorScheme = ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimaryDark,
      surface: AppColors.backgroundDark,
      onSurface: AppColors.whiteSoft,
      secondary: AppColors.primary.withValues(alpha: .8),
      onSecondary: AppColors.whiteSoft,
      tertiary: AppColors.primary.withValues(alpha: .6),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: AppTypography.darkTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.darkTextTheme().titleLarge,
        iconTheme: const IconThemeData(color: AppColors.whiteSoft),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.whiteSoft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: AppTypography.darkTextTheme().titleMedium,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.backgroundDark,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: AppColors.primary.withValues(alpha: .4), width: 1.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: AppColors.primary.withValues(alpha: .35), width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.6),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.primary.withValues(alpha: .15),
        selectedColor: AppColors.primary,
        labelStyle: AppTypography.darkTextTheme().labelMedium!,
        secondaryLabelStyle: AppTypography.darkTextTheme().labelMedium!,
        side: BorderSide(color: AppColors.primary.withValues(alpha: .4)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      cardTheme: CardThemeData(
        color: AppColors.backgroundDark,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: const EdgeInsets.all(12),
      ),
      iconTheme: const IconThemeData(color: AppColors.whiteSoft),
    );
  }
}
