import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lab_1_shapes/FileManager.dart';

import 'home_page/home_page_screen.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<FileManager>(FileManager(), signalsReady: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xFF81B29A),
          appBarTheme: AppBarTheme(
            color: Color(0xFF3D405B),
            iconTheme: IconThemeData(
              color: Color(0xFFF4F1DE),
            ),
          ),
          scaffoldBackgroundColor: Color(0xFFF4F1DE),
          tabBarTheme: TabBarTheme(
            labelColor: Color(0xFF81B29A),
          )),
      home: MyHomePage(),
    );
  }
}
