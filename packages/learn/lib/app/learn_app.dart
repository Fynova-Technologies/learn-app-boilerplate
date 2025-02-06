import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn/config/route/router.dart';
import 'package:learn/core/providers/locale_provider.dart';
import 'package:learn_resources/learn_resources.dart';

class LearnApp extends ConsumerWidget {
  const LearnApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedString = ref.watch(languageProvider);

    const localization = LearnLocalization();

    return LearnTheme(
        themeMode: ThemeMode.light,
        builder: (config) {
          return MaterialApp.router(
              localizationsDelegates: localization.delegates,
              supportedLocales: localization.supportedLocales,
              locale: const Locale('ne'),
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              theme: config.light,
              darkTheme: config.dark);
        });
  }
}
