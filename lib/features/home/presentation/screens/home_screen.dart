import 'package:flutter/material.dart';
import 'package:orbit/gen/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(t.appTitle)),
      body: Center(
        child: Text(t.helloWorld,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
