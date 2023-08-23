import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:exif/exif.dart';

extension XFileExtension on XFile? {
  Future<String> getTime() async {
    if (this == null) {
      return '';
    }
    final File file = File(this!.path);
    if (await file.exists()) {
      FileStat fileStat = await file.stat();
      DateTime creationTime = fileStat.changed;
      return DateFormat('yyy/MM/dd HH:mm').format(creationTime);
    }
    return '';
  }

  // Future<String> getLocation() async {
  //   if (this == null) {
  //     return '';
  //   }
  //   final File file = File(this!.path);
  //   final List<int> imgBytes = await this!.readAsBytes();
  //   final exifData = await readExifFromBytes(imgBytes);
  //   // final Map<String, IfdTag> exifData =
  //   //     await readExifFromBytes(await file.readAsBytes());
  //   return '';
  // }

  // String _convertLatLong(List<String> components) {
  //   final degrees = double.parse(components[0]);
  //   final minutes = double.parse(components[1]);
  //   final seconds = double.parse(components[2]);

  //   return '$degrees° $minutes\' $seconds"';
  // }
}
