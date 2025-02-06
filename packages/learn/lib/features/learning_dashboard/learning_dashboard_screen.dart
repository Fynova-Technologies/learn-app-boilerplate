import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_components/learn_componenets.dart';
import 'package:learn_resources/learn_resources.dart';

class LearningDashboardScreen extends ConsumerWidget {
  const LearningDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.loc.headerText),
            Picture(source: Asset.footer.add),
            Picture(source: Asset.footer.chat),
            const SizedBox(
              height: 50,
              width: 100,
              child: Text("this is container text"),
            )
          ],
        ));
  }
}
