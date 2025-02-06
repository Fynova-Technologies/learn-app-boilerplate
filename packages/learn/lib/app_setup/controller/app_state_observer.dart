import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:learn/app_setup/controller/app_controller.dart';
import 'package:learn/features/learning_dashboard/learning_dashboard_screen.dart';

class AppStateObserver extends ConsumerWidget {
  const AppStateObserver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We can implement dynamic routing as per the app state
    final appState = ref.watch(appController);
    return appState.map(
      started: (_) => const LearningDashboardScreen(),
      showOnBoarding: (_) => const LearningDashboardScreen(),
      authenticated: (_) => const LearningDashboardScreen(),
      unAuthenticated: (_) => const LearningDashboardScreen(),
    );
  }
}
