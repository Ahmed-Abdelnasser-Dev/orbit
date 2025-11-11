import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Canonical spacing, paddings, margins, and radii for the app.
///
/// Uses an 8pt base rhythm (8, 16, 24...) with a 4pt micro-step when needed.
/// Values scale responsively via ScreenUtil.
class AppSpacing {
  AppSpacing._();

  // --- Scalar spacing (responsive) ---
  static double get s4 => 4.w;
  static double get s8 => 8.w;
  static double get s12 => 12.w;
  static double get s16 => 16.w;
  static double get s20 => 20.w;
  static double get s24 => 24.w;
  static double get s32 => 32.w;
  static double get s40 => 40.w;
  static double get s48 => 48.w;
  static double get s56 => 56.w;

  // --- Gaps (vertical) ---
  static Widget get gap4 => SizedBox(height: s4);
  static Widget get gap8 => SizedBox(height: s8);
  static Widget get gap12 => SizedBox(height: s12);
  static Widget get gap16 => SizedBox(height: s16);
  static Widget get gap20 => SizedBox(height: s20);
  static Widget get gap24 => SizedBox(height: s24);
  static Widget get gap32 => SizedBox(height: s32);

  // --- Gaps (horizontal) ---
  static Widget get hgap4 => SizedBox(width: s4);
  static Widget get hgap8 => SizedBox(width: s8);
  static Widget get hgap12 => SizedBox(width: s12);
  static Widget get hgap16 => SizedBox(width: s16);
  static Widget get hgap20 => SizedBox(width: s20);
  static Widget get hgap24 => SizedBox(width: s24);
  static Widget get hgap32 => SizedBox(width: s32);

  // --- EdgeInsets (all) ---
  static EdgeInsets get a4 => EdgeInsets.all(4.r);
  static EdgeInsets get a8 => EdgeInsets.all(8.r);
  static EdgeInsets get a12 => EdgeInsets.all(12.r);
  static EdgeInsets get a16 => EdgeInsets.all(16.r);
  static EdgeInsets get a20 => EdgeInsets.all(20.r);
  static EdgeInsets get a24 => EdgeInsets.all(24.r);
  static EdgeInsets get a32 => EdgeInsets.all(32.r);

  // --- EdgeInsets (symmetric) ---
  static EdgeInsets get ph8 => EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets get ph12 => EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets get ph16 => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get ph20 => EdgeInsets.symmetric(horizontal: 20.w);
  static EdgeInsets get ph24 => EdgeInsets.symmetric(horizontal: 24.w);

  static EdgeInsets get pv8 => EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets get pv12 => EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets get pv16 => EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets get pv20 => EdgeInsets.symmetric(vertical: 20.h);
  static EdgeInsets get pv24 => EdgeInsets.symmetric(vertical: 24.h);

  // --- EdgeInsets (only) ---
  static EdgeInsets get pt16 => EdgeInsets.only(top: 16.h);
  static EdgeInsets get pr16 => EdgeInsets.only(right: 16.w);
  static EdgeInsets get pb16 => EdgeInsets.only(bottom: 16.h);
  static EdgeInsets get pl16 => EdgeInsets.only(left: 16.w);

  // --- BorderRadius (responsive) ---
  static BorderRadius get r8 => BorderRadius.circular(8.r);
  static BorderRadius get r12 => BorderRadius.circular(12.r);
  static BorderRadius get r16 => BorderRadius.circular(16.r);
  static BorderRadius get r20 => BorderRadius.circular(20.r);
  static BorderRadius get r24 => BorderRadius.circular(24.r);

  /// Very large radius to create a pill shape for buttons/chips.
  static BorderRadius get pill => BorderRadius.circular(999.r);
}
