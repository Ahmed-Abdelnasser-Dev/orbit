import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  /// Base Poppins text theme tinted for light mode.
  static TextTheme lightTextTheme([TextTheme? base]) {
    final b =
        base ?? Typography.material2021(platform: TargetPlatform.android).black;
    final themed = GoogleFonts.poppinsTextTheme(b);
    return themed.copyWith(
      displayLarge: themed.displayLarge?.copyWith(
          color: AppColors.backgroundDark, fontWeight: FontWeight.w700),
      displayMedium: themed.displayMedium?.copyWith(
          color: AppColors.backgroundDark, fontWeight: FontWeight.w700),
      displaySmall: themed.displaySmall?.copyWith(
          color: AppColors.backgroundDark, fontWeight: FontWeight.w700),
      headlineLarge: themed.headlineLarge
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w700),
      headlineMedium: themed.headlineMedium?.copyWith(
          color: AppColors.backgroundDark, fontWeight: FontWeight.w700),
      headlineSmall: themed.headlineSmall?.copyWith(
          color: AppColors.backgroundDark, fontWeight: FontWeight.w700),
      titleLarge: themed.titleLarge?.copyWith(
          color: AppColors.backgroundDark, fontWeight: FontWeight.w600),
      titleMedium: themed.titleMedium?.copyWith(
          color: AppColors.backgroundDark, fontWeight: FontWeight.w600),
      titleSmall: themed.titleSmall?.copyWith(
          color: AppColors.backgroundDark, fontWeight: FontWeight.w600),
      bodyLarge: themed.bodyLarge
          ?.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
      bodyMedium: themed.bodyMedium?.copyWith(color: AppColors.bodyText),
      bodySmall: themed.bodySmall?.copyWith(color: AppColors.bodyText),
      labelLarge: themed.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      labelMedium: themed.labelMedium?.copyWith(fontWeight: FontWeight.w600),
      labelSmall: themed.labelSmall?.copyWith(fontWeight: FontWeight.w600),
    );
  }

  /// Base Poppins text theme tinted for dark mode.
  static TextTheme darkTextTheme([TextTheme? base]) {
    final b =
        base ?? Typography.material2021(platform: TargetPlatform.android).white;
    final themed = GoogleFonts.poppinsTextTheme(b);
    return themed.copyWith(
      displayLarge: themed.displayLarge
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w700),
      displayMedium: themed.displayMedium
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w700),
      displaySmall: themed.displaySmall
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w700),
      headlineLarge: themed.headlineLarge
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w700),
      headlineMedium: themed.headlineMedium
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w700),
      headlineSmall: themed.headlineSmall
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w700),
      titleLarge: themed.titleLarge
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w600),
      titleMedium: themed.titleMedium
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w600),
      titleSmall: themed.titleSmall
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w600),
      bodyLarge: themed.bodyLarge
          ?.copyWith(color: AppColors.bodyText, fontWeight: FontWeight.w500),
      bodyMedium: themed.bodyMedium?.copyWith(color: AppColors.bodyText),
      bodySmall: themed.bodySmall?.copyWith(color: AppColors.bodyText),
      labelLarge: themed.labelLarge
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w600),
      labelMedium: themed.labelMedium
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w600),
      labelSmall: themed.labelSmall
          ?.copyWith(color: AppColors.whiteSoft, fontWeight: FontWeight.w600),
    );
  }
}
