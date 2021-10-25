import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'components/controller/user_controller.dart';
import 'components/theme/theme/theme_date.dart';
import 'route_generate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocators();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CJP',
      theme: theme,
      initialRoute: "/",
      onGenerateRoute: RouteGenerate.generateRoute,
    ),
  );
}

void setupLocators() {
  GetIt.I.registerSingleton(UserController());
}
