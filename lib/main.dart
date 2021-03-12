import 'package:flutter/material.dart';
import 'package:tahweela/routes.dart';
import 'package:tahweela/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'space x',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Constant.HOME,
      onGenerateRoute: MRouter.generateRoute,
    );
  }
}
