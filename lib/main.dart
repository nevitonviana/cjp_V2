import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'components/theme/thema/theme_date.dart';
import 'route_generate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'CJP',
      theme: theme,
      initialRoute: "/",
      onGenerateRoute: RouteGenerate.generateRoute,
    ),
  );
}
