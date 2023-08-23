import 'package:demo/pick_image_page/image_model.dart';
import 'package:demo/utils/xfile_ext.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController {
  RxList<ImageModel>? listImageModel = RxList();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future onOpenCamera() async {
    final XFile? photo =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (photo != null) {
      final String imgTime = await photo.getTime();
      // final String imgLocation = await photo.getLocation();
      listImageModel?.insert(0, ImageModel(xFile: photo, time: imgTime));
    }
  }
}
