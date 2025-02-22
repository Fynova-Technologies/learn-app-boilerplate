// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:learn/app_setup/local_database/hive/hive_setup.dart';
// import 'package:learn/firebase_options.dart';

class AppInit {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);

    await HiveSetup.initHive;
  }
}
