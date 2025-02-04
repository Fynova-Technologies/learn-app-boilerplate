import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_resources/learn_resources.dart';

final languageProvider = StateProvider<String>(
    (ref) => const LearnLocalization().supportedLocales.first.languageCode);

final supportedLocalesProvider =
    Provider<List<Locale>>((_) => const LearnLocalization().supportedLocales);
