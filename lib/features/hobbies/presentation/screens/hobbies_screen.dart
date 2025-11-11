import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/l10n/app_localizations.dart';
import '../../../../core/styles/app_colors.dart';

/// Hobbies screen for tracking leisure activities.
class HobbiesScreen extends StatelessWidget {
  const HobbiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.hobbiesTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              t.hobbiesSubtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.bodyText,
                    fontSize: 12.sp,
                  ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Hobbies content coming soon'),
      ),
    );
  }
}
