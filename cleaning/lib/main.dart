import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cleaning/config/config.dart';
import 'package:cleaning/pages/plans_page_view/general.dart';
import 'package:provider/provider.dart';

import 'controllers/general_controller.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GeneralController controller = GeneralController();

  @override
  Widget build(BuildContext context) {
    return Provider<GeneralController>(
      create: (_) => controller,
      child: MaterialApp(
        color: AppConfig.whiteColor,
        theme: ThemeData(fontFamily: AppConfig.fontFamilyInter),
        debugShowCheckedModeBanner: false,
        home: const General(),
      ),
    );
  }
}
