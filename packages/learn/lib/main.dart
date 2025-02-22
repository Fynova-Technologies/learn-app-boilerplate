import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn/app/learn_app.dart';
import 'package:learn/app_setup/app_init/app_init.dart';

void main() async {
  initializeApp();
}

Future initializeApp() async {
  runZonedGuarded(() async {
    await AppInit.initialize();

    runApp(const ProviderScope(child: LearnApp()));
  }, (error, stack) {});
}
