import 'package:get/get.dart';
import 'package:demo/pick_image_page/pick_image_controller.dart';

class PickImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PickImageController());
  }
}
