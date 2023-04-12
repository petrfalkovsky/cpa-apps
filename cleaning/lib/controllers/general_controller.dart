import 'package:flutter/material.dart';
import 'package:cleaning/controllers/order_controller.dart';

class GeneralController {
  final navigatorKeyOrder = GlobalKey<NavigatorState>();

  /// ORDER
  late OrderController orderController;

  GeneralController() {
    orderController = OrderController(navigatorKeyOrder: navigatorKeyOrder);
  }
}
