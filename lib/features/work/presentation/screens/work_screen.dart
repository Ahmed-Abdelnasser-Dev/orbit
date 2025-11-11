import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../gen/l10n/app_localizations.dart';
import '../../../../core/styles/app_colors.dart';

/// Work screen for managing tasks and productivity.
class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.workTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              t.workSubtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.bodyText,
                    fontSize: 12.sp,
                  ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Work content coming soon'),
      ),
    );
  }
}
