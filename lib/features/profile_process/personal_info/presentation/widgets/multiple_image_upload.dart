import 'dart:io';
import 'package:accompani_bloc/core/common_widgets/buttom_modal/buttom_modal.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/core/constants/text_strings.dart';
import 'package:accompani_bloc/core/utils/pick_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MultipleImageUpload extends StatefulWidget {
  const MultipleImageUpload({
    super.key,
  });

  @override
  State<MultipleImageUpload> createState() => _MultipleImageUploadState();
}

class _MultipleImageUploadState extends State<MultipleImageUpload> {
  File? image1;
  File? image2;
  File? image3;

  selectImageCamera() async {
    final pickedImage = await pickImageCamera();
    if (pickedImage != null) {
      setState(() {
        image1 = pickedImage;
      });
    }
    return image1;
  }

  selectImageCamera2() async {
    final pickedImage = await pickImageCamera2();
    if (pickedImage != null) {
      setState(() {
        image2 = pickedImage;
      });
    }
    return image2;
  }

  selectImageCamera3() async {
    final pickedImage = await pickImageCamera3();
    if (pickedImage != null) {
      setState(() {
        image3 = pickedImage;
      });
    }
    return image3;
  }

  selectImageGallery() async {
    final pickedImage = await pickImageGallery();
    if (pickedImage != null) {
      setState(() {
        image1 = pickedImage;
      });
    }
    return image1;
  }

  selectImageGallery2() async {
    final pickedImage = await pickImageGallery2();
    if (pickedImage != null) {
      setState(() {
        image2 = pickedImage;
      });
    }
    return image2;
  }

  selectImageGallery3() async {
    final pickedImage = await pickImageGallery3();
    if (pickedImage != null) {
      setState(() {
        image3 = pickedImage;
      });
    }
    return image3;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          // Left Container
          ImageWidget(
              image1: image1,
              context: context,
              cameraFn: selectImageCamera(),
              galleryFn: selectImageGallery(),
              isRight: true),

          // Right Column of Containers
          Expanded(
            child: Column(
              children: [
                ImageWidget(
                    image1: image1,
                    context: context,
                    cameraFn: selectImageCamera2(),
                    galleryFn: selectImageGallery2(),
                    isRight: false),
                const SizedBox(
                  height: 8.0,
                ),
                ImageWidget(
                    image1: image1,
                    context: context,
                    cameraFn: selectImageCamera3(),
                    galleryFn: selectImageGallery3(),
                    isRight: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image1,
    required this.context,
    required this.cameraFn,
    required this.galleryFn,
    required this.isRight,
  });

  final File? image1;
  final BuildContext context;
  final Future cameraFn;
  final Future galleryFn;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(tDefaultSize - 10),
          ),
          builder: (context) => Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tForgotPasswordTitle,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    'Select one of the options below, to add image',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: tDefaultSize,
                  ),
                  ButtomModal(
                    btnIcon: Icons.camera_enhance_rounded,
                    title: 'Camera',
                    subTitle: 'Take live image',
                    onTap: () {
                      Navigator.pop(context);
                      cameraFn;
                    },
                  ),
                  const SizedBox(
                    height: tDefaultSize - 10,
                  ),
                  ButtomModal(
                    btnIcon: Icons.photo_album_rounded,
                    title: 'Gallery',
                    subTitle: 'Select from Gallery',
                    onTap: () {
                      Navigator.pop(context);
                      galleryFn;
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 180, 180, 180),
              borderRadius: BorderRadius.circular(10.0)),
          width: isRight
              ? MediaQuery.of(context).size.width * 0.5
              : double.infinity,
          height: isRight ? 200 : 95,
          margin: const EdgeInsets.only(right: 10.0),
          child: kIsWeb
              ? image1 == null
                  ? IconButton(
                      icon: const Icon(Icons.add_a_photo_outlined),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(tDefaultSize - 10),
                            ),
                            builder: (context) => Container(
                                  padding: const EdgeInsets.all(tDefaultSize),
                                  child: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tForgotPasswordTitle,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                          Text(
                                            'Select one of the options below, to add image',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          ),
                                          const SizedBox(
                                            height: tDefaultSize,
                                          ),
                                          ButtomModal(
                                            btnIcon:
                                                Icons.camera_enhance_rounded,
                                            title: 'Camera',
                                            subTitle: 'Take live image',
                                            onTap: () {
                                              Navigator.pop(context);
                                              cameraFn;
                                            },
                                          ),
                                          const SizedBox(
                                            height: tDefaultSize - 10,
                                          ),
                                          ButtomModal(
                                            btnIcon: Icons.photo_album_rounded,
                                            title: 'Gallery',
                                            subTitle: 'Select from Gallery',
                                            onTap: () {
                                              Navigator.pop(context);
                                              galleryFn;
                                            },
                                          )
                                        ]),
                                  ),
                                ));
                      },
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(image1!, fit: BoxFit.cover))
              : image1 == null
                  ? IconButton(
                      icon: const Icon(Icons.add_a_photo_outlined),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(tDefaultSize - 10),
                          ),
                          builder: (context) => Container(
                              padding: const EdgeInsets.all(tDefaultSize),
                              child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tForgotPasswordTitle,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                      Text(
                                        'Select one of the options below, to add image',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                      const SizedBox(
                                        height: tDefaultSize,
                                      ),
                                      ButtomModal(
                                        btnIcon: Icons.camera_enhance_rounded,
                                        title: 'Camera',
                                        subTitle: 'Take live image',
                                        onTap: () {
                                          Navigator.pop(context);
                                          cameraFn;
                                        },
                                      ),
                                      const SizedBox(
                                        height: tDefaultSize - 10,
                                      ),
                                      ButtomModal(
                                        btnIcon: Icons.photo_album_rounded,
                                        title: 'Gallery',
                                        subTitle: 'Select from Gallery',
                                        onTap: () {
                                          Navigator.pop(context);
                                          galleryFn;
                                        },
                                      ),
                                    ]),
                              )),
                        );
                      },
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        image1!,
                        fit: BoxFit.cover,
                      ),
                    )),
    );
  }
}
