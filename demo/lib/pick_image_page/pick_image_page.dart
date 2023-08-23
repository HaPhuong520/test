import 'package:demo/pick_image_page/pick_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class PickImagePage extends StatelessWidget {
  const PickImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickImageController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text("List image from camera"),
                centerTitle: true,
              ),
              body: Center(child: Obx(
                () {
                  return (controller.listImageModel?.isEmpty ?? false)
                      ? const Text("No image to show")
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: ListView.builder(
                            itemCount: controller.listImageModel?.length,
                            itemBuilder: (_, id) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Image.file(File(controller
                                              .listImageModel![id]
                                              .xFile!
                                              .path)),
                                          Positioned(
                                            bottom: 5,
                                            right: 5,
                                            child: Text(
                                                style: const TextStyle(
                                                    color: Colors.pink),
                                                "${controller.listImageModel?[id].time}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                          controller.listImageModel?[id]
                                                  .getName ??
                                              '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                },
              )),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  await controller.onOpenCamera();
                },
                child: const Icon(Icons.camera_alt),
              ),
            ));
  }
}
