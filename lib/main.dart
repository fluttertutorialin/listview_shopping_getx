import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'ui/page/product_page.dart';
import 'binding/product_binding.dart';

void main() {
  //STATUS BAR SET
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: "/",
        getPages: [
          GetPage(
              name: "/", page: () => ProductPage(), binding: ProductBinding()),
        ]);
  }
}
