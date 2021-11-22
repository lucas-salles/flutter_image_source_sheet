class PictureCaptureStatus {
  final bool isCameraAvailable;
  final String error;
  final bool stopScanner;

  PictureCaptureStatus(
      {this.isCameraAvailable = false,
      this.error = "",
      this.stopScanner = false});

  factory PictureCaptureStatus.available() =>
      PictureCaptureStatus(isCameraAvailable: true, stopScanner: false);

  factory PictureCaptureStatus.error(String message) =>
      PictureCaptureStatus(error: message, stopScanner: true);

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;
}
