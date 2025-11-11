import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'gen/l10n/app_localizations.dart';
import 'core/styles/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/dependency_injection/di_container.dart';
import 'features/user/presentation/bloc/user_bloc.dart';
import 'features/user/domain/entities/preferences.dart';

class OrbitApp extends StatelessWidget {
  const OrbitApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = di.get<AppRouter>().router;

    return BlocProvider(
      create: (_) => di<UserBloc>()..add(const LoadUserDataEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          // Determine theme mode from user preferences
          ThemeMode themeMode = ThemeMode.system;
          if (state.preferences != null) {
            switch (state.preferences!.theme) {
              case AppThemePreference.light:
                themeMode = ThemeMode.light;
                break;
              case AppThemePreference.dark:
                themeMode = ThemeMode.dark;
                break;
              case AppThemePreference.system:
                themeMode = ThemeMode.system;
                break;
            }
          }

          // Determine locale from user preferences
          Locale? locale;
          if (state.preferences != null) {
            locale = Locale(state.preferences!.languageCode);
          }

          return MaterialApp.router(
            title: 'Orbit',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: themeMode,
            locale: locale,
            routerConfig: router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
