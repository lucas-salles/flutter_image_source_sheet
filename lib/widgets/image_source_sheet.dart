import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_source_sheet/screens/picture_capture/picture_capture_screen.dart';

class ImageSourceSheet extends StatelessWidget {
  final Function(File) onImageSelected;
  final bool cameraOverlay;

  const ImageSourceSheet(
      {Key? key, required this.onImageSelected, required this.cameraOverlay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () async {
              final XFile? imageFile = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PictureCaptureScreen(
                    cameraOverlay: cameraOverlay,
                  ),
                ),
              );
              if (imageFile != null) {
                onImageSelected(File(imageFile.path));
              }
            },
            child: Text(
              "Câmera",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              XFile? imageFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (imageFile != null) {
                onImageSelected(File(imageFile.path));
              }
            },
            child: Text(
              "Galeria",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<T?> showImageSourceSheet<T>({
  required BuildContext context,
  required Function(File) onImageSelected,
  bool cameraOverlay = true,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool isScrollControlled = false,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => ImageSourceSheet(
      onImageSelected: onImageSelected,
      cameraOverlay: cameraOverlay,
    ),
    backgroundColor: backgroundColor,
    elevation: elevation,
    shape: shape,
    clipBehavior: clipBehavior,
    constraints: constraints,
    barrierColor: barrierColor,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    routeSettings: routeSettings,
    transitionAnimationController: transitionAnimationController,
  );
}
