import 'package:demo/pick_image_page/pick_image_binding.dart';
import 'package:demo/pick_image_page/pick_image_page.dart';
import 'package:demo/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     initialBinding: PickImageBinding(),
      debugShowCheckedModeBanner: false,
      home: const PickImagePage(),
      getPages: Pages.listPage,
    );
  }
}
