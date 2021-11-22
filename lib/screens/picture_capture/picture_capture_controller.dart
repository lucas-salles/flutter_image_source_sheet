import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_source_sheet/screens/picture_capture/picture_capture_status.dart';

class PictureCaptureController {
  final statusNotifier =
      ValueNotifier<PictureCaptureStatus>(PictureCaptureStatus());
  PictureCaptureStatus get status => statusNotifier.value;
  set status(PictureCaptureStatus status) => statusNotifier.value = status;

  CameraController? cameraController;

  CameraLensDirection currentCameraDirection = CameraLensDirection.front;
  List<CameraDescription> cameras = [];

  void getAvailableCameras() async {
    try {
      cameras = await availableCameras();
      toggleCamera();
    } catch (e) {
      status = PictureCaptureStatus.error(e.toString());
      await cameraController!.dispose();
    }
  }

  void toggleCamera() async {
    try {
      if (cameraController != null) {
        await cameraController!.dispose();
      }

      if (currentCameraDirection == CameraLensDirection.back) {
        currentCameraDirection = CameraLensDirection.front;
      } else {
        currentCameraDirection = CameraLensDirection.back;
      }

      final camera = cameras.firstWhere(
          (element) => element.lensDirection == currentCameraDirection);

      cameraController =
          CameraController(camera, ResolutionPreset.max, enableAudio: false);

      await cameraController!.initialize();
      status = PictureCaptureStatus.available();
    } catch (e) {
      status = PictureCaptureStatus.error(e.toString());
      await cameraController!.dispose();
    }
  }

  Future<XFile> takePhoto() async {
    return await cameraController!.takePicture();
  }

  void dispose() {
    statusNotifier.dispose();
    if (status.showCamera) {
      cameraController!.dispose();
    }
  }
}
