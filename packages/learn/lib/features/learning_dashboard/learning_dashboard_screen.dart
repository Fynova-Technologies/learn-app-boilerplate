import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_resources/learn_resources.dart';

class LearningDashboardScreen extends ConsumerWidget {
  const LearningDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(context.loc.appName),
      ),
    );
  }
}
