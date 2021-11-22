import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_source_sheet/screens/picture_capture/picture_capture_controller.dart';
import 'package:image_source_sheet/screens/picture_capture/picture_capture_status.dart';
import 'package:image_source_sheet/widgets/camera_overlay.dart';

class PictureCaptureScreen extends StatefulWidget {
  final bool cameraOverlay;

  const PictureCaptureScreen({Key? key, required this.cameraOverlay})
      : super(key: key);

  @override
  State<PictureCaptureScreen> createState() => _PictureCaptureScreenState();
}

class _PictureCaptureScreenState extends State<PictureCaptureScreen> {
  final _controller = PictureCaptureController();

  @override
  void initState() {
    super.initState();
    _controller.getAvailableCameras();
  }

  void _takePhoto() async {
    final XFile imageFile = await _controller.takePhoto();
    Navigator.of(context).pop(imageFile);
  }

  void _switchCamera() {
    _controller.toggleCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ValueListenableBuilder<PictureCaptureStatus>(
            valueListenable: _controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return AspectRatio(
                  aspectRatio: _controller.cameraController!.value.aspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CameraPreview(_controller.cameraController!),
                      if (widget.cameraOverlay)
                        CameraOverlay(
                            padding: 40,
                            aspectRatio: 1,
                            borderWidth: 3,
                            borderColor: Colors.cyan),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("Captura de Imagem"),
              centerTitle: true,
            ),
            bottomNavigationBar: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _takePhoto,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 32,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      primary: Colors.transparent,
                      elevation: 0,
                      onPrimary: Colors.transparent,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _switchCamera,
                    child: Icon(
                      Icons.cameraswitch,
                      color: Colors.white,
                      size: 32,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      primary: Colors.transparent,
                      elevation: 0,
                      onPrimary: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
