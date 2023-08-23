import 'package:demo/pick_image_page/pick_image_controller.dart';
import 'package:demo/pick_image_page/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickImagePage extends StatelessWidget {
  const PickImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return const IpadPage();
      } else {
        return const PhonePage();
      }
    });
  }
}

class IpadPage extends StatelessWidget {
  const IpadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickImageController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("List image from camera"),
          centerTitle: true,
        ),
        body: Row(
          children: [
            Obx(
              () => Flexible(
                flex: 1,
                child: ListView.builder(
                  itemCount: controller.listImageModel?.length,
                  itemBuilder: (_, id) {
                    return InkWell(
                      onTap: () {
                        controller.onOpenImage(id);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.black, width: 1))),
                        child: Text(
                            controller.listImageModel?[id].getName ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GetBuilder<PickImageController>(
              builder: (controller) => Flexible(
                flex: 3,
                child: controller.selectedImage == null
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            ImageWidget(imageModel: controller.selectedImage),
                      ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await controller.onOpenCamera();
          },
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}

class PhonePage extends StatelessWidget {
  const PhonePage({
    super.key,
  });
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
                                  child: ImageWidget(
                                    imageModel: controller.listImageModel?[id],
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
