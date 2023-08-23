import 'package:image_picker/image_picker.dart';

class ImageModel {
  String? time;
  String? location;
  final XFile? xFile;
  ImageModel({this.time, this.location, this.xFile});

  String get getName {
    return (xFile == null) ? '' : xFile!.name;
  }
}
