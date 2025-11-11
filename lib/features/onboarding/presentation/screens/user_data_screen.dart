import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../gen/l10n/app_localizations.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_spacing.dart';
import '../../../user/domain/entities/user_profile.dart';
import '../bloc/onboarding_bloc.dart';
import '../widgets/onboarding_button.dart';

/// User Data screen - Collect age, weight, height, sleep schedule.
class UserDataScreen extends StatefulWidget {
  final VoidCallback onContinue;

  const UserDataScreen({
    super.key,
    required this.onContinue,
  });

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  TimeOfDay _wakeUpTime = const TimeOfDay(hour: 7, minute: 0);
  TimeOfDay _sleepTime = const TimeOfDay(hour: 23, minute: 0);

  @override
  void dispose() {
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context, bool isWakeUp) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isWakeUp ? _wakeUpTime : _sleepTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              shape: RoundedRectangleBorder(borderRadius: AppSpacing.r16),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isWakeUp) {
          _wakeUpTime = picked;
        } else {
          _sleepTime = picked;
        }
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      final profile = UserProfile(
        age: int.parse(_ageController.text),
        weightKg: double.parse(_weightController.text),
        heightCm: double.parse(_heightController.text),
        wakeSleep: TimeOfDayWakeSleep(
          wakeUp: _formatTime(_wakeUpTime),
          sleep: _formatTime(_sleepTime),
        ),
      );

      context.read<OnboardingBloc>().add(SaveUserDataEvent(profile));
      widget.onContinue();
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.s24),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSpacing.s16),
                  // Title
                  Text(
                    t.userDataTitle,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.whiteSoft
                          : AppColors.backgroundDark,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s8),
                  Text(
                    t.userDataSubtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.bodyText,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s32),
                  // Age Field
                  Text(
                    t.ageLabel,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteSoft
                          : AppColors.backgroundDark,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s8),
                  TextFormField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      hintText: t.ageHint,
                      filled: true,
                      fillColor: isDark
                          ? AppColors.backgroundDark
                          : AppColors.whiteSoft.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: AppColors.bodyText.withOpacity(0.3),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: AppColors.bodyText.withOpacity(0.3),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.errorRequiredField;
                      }
                      final age = int.tryParse(value);
                      if (age == null || age < 1 || age > 120) {
                        return t.errorInvalidAge;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppSpacing.s24),
                  // Weight Field
                  Text(
                    t.weightLabel,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteSoft
                          : AppColors.backgroundDark,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s8),
                  TextFormField(
                    controller: _weightController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: InputDecoration(
                      hintText: t.weightHint,
                      filled: true,
                      fillColor: isDark
                          ? AppColors.backgroundDark
                          : AppColors.whiteSoft.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: AppColors.bodyText.withOpacity(0.3),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: AppColors.bodyText.withOpacity(0.3),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.errorRequiredField;
                      }
                      final weight = double.tryParse(value);
                      if (weight == null || weight < 20 || weight > 300) {
                        return t.errorInvalidWeight;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppSpacing.s24),
                  // Height Field
                  Text(
                    t.heightLabel,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteSoft
                          : AppColors.backgroundDark,
                    ),
                  ),
                  SizedBox(height: AppSpacing.s8),
                  TextFormField(
                    controller: _heightController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                    decoration: InputDecoration(
                      hintText: t.heightHint,
                      filled: true,
                      fillColor: isDark
                          ? AppColors.backgroundDark
                          : AppColors.whiteSoft.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: AppColors.bodyText.withOpacity(0.3),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: AppColors.bodyText.withOpacity(0.3),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: AppSpacing.r12,
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.errorRequiredField;
                      }
                      final height = double.tryParse(value);
                      if (height == null || height < 50 || height > 300) {
                        return t.errorInvalidHeight;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppSpacing.s24),
                  // Sleep Schedule
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t.wakeUpTimeLabel,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? AppColors.whiteSoft
                                    : AppColors.backgroundDark,
                              ),
                            ),
                            SizedBox(height: AppSpacing.s8),
                            InkWell(
                              onTap: () => _selectTime(context, true),
                              borderRadius: AppSpacing.r12,
                              child: Container(
                                padding: EdgeInsets.all(AppSpacing.s16),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? AppColors.backgroundDark
                                      : AppColors.whiteSoft.withOpacity(0.5),
                                  border: Border.all(
                                    color: AppColors.bodyText.withOpacity(0.3),
                                  ),
                                  borderRadius: AppSpacing.r12,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _wakeUpTime.format(context),
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: isDark
                                            ? AppColors.whiteSoft
                                            : AppColors.backgroundDark,
                                      ),
                                    ),
                                    Icon(
                                      Icons.access_time,
                                      color: AppColors.primary,
                                      size: 20.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: AppSpacing.s16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t.sleepTimeLabel,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? AppColors.whiteSoft
                                    : AppColors.backgroundDark,
                              ),
                            ),
                            SizedBox(height: AppSpacing.s8),
                            InkWell(
                              onTap: () => _selectTime(context, false),
                              borderRadius: AppSpacing.r12,
                              child: Container(
                                padding: EdgeInsets.all(AppSpacing.s16),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? AppColors.backgroundDark
                                      : AppColors.whiteSoft.withOpacity(0.5),
                                  border: Border.all(
                                    color: AppColors.bodyText.withOpacity(0.3),
                                  ),
                                  borderRadius: AppSpacing.r12,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _sleepTime.format(context),
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: isDark
                                            ? AppColors.whiteSoft
                                            : AppColors.backgroundDark,
                                      ),
                                    ),
                                    Icon(
                                      Icons.access_time,
                                      color: AppColors.primary,
                                      size: 20.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.s32),
                  // Continue Button
                  OnboardingButton(
                    text: t.finishButton,
                    onPressed: _submitData,
                  ),
                  SizedBox(height: AppSpacing.s24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
