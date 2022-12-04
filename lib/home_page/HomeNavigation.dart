import 'package:flutter/material.dart';
import 'package:lab_1_shapes/home_page/choose_coordinates_screen.dart';
import 'package:lab_1_shapes/home_page/draw_page.dart';
import 'package:lab_1_shapes/home_page/start_screen.dart';
import 'package:lab_1_shapes/model/ShapeTypes.dart';
class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return StartScreen();
                case '/chooseCoordinates':
                  return CoordinatesInput(shapeType: settings.arguments as ShapeType);
                case '/draw':
                  return DrawPage(arguments: settings.arguments as DrawPageArguments);
              }
              return SizedBox.shrink();
            });
      },
    );
  }
}
