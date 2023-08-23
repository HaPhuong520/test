import 'dart:io';
import 'package:demo/pick_image_page/image_model.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.imageModel});
  final ImageModel? imageModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.file(File(imageModel!.xFile!.path)),
            Positioned(
              bottom: 5,
              right: 5,
              child: Text(
                  style: const TextStyle(color: Colors.white),
                  "${imageModel?.time}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
            )
          ],
        ),
        const SizedBox(height: 5),
        Text(imageModel?.getName ?? '',
            overflow: TextOverflow.ellipsis, maxLines: 2),
      ],
    );
  }
}
