import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider_setup.dart';
import 'ui/router.dart' as router;

void main() {
  // Logger.level = Level.info;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: router.initialRoute,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
