import 'package:demo/pick_image_page/pick_image_binding.dart';
import 'package:demo/pick_image_page/pick_image_page.dart';
import 'package:get/get.dart';

class Pages {
  static List<GetPage> listPage = [
    GetPage(
        name: RouterName.getImage,
        page: () => const PickImagePage(),
        binding: PickImageBinding())
  ];
}

class RouterName {
  static const String getImage = '/image';
}
