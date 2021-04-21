import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:pharous/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: Size(320, 676),
      allowFontScaling: false,
       builder: () => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),

        routes: AppRoute.routes,
        initialRoute: AppRoute.Home,
      ),
    );
  }
}





