import 'package:flutter_todo_digital_prizm/routes/route_constants.dart';
import 'package:flutter_todo_digital_prizm/src/view/screen/home_screen.dart';
import 'package:flutter_todo_digital_prizm/src/view/screen/add_todo_screen.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();

  static List<GetPage> get routes => [
    GetPage(
      name: RouteConstants.homeRoute,
      page: () => HomeScreen(),
    ),
    GetPage(
        name: RouteConstants.todoScreenRoute,
        page: () => TodoScreen(),
    ),
  ];
}
