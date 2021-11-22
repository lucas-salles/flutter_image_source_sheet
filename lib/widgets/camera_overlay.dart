import 'package:flutter/material.dart';

class CameraOverlay extends StatelessWidget {
  final double padding;
  final double aspectRatio;
  final double borderWidth;
  final Color borderColor;

  const CameraOverlay(
      {Key? key,
      required this.padding,
      required this.aspectRatio,
      required this.borderWidth,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
        double horizontalPadding;
        double verticalPadding;

        if (parentAspectRatio < aspectRatio) {
          horizontalPadding = padding;
          verticalPadding = (constraints.maxHeight -
                  ((constraints.maxWidth - 2 * padding) / aspectRatio)) /
              2;
        } else {
          verticalPadding = padding;
          horizontalPadding = (constraints.maxWidth -
                  ((constraints.maxHeight - 2 * padding) * aspectRatio)) /
              2;
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: horizontalPadding,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: horizontalPadding,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(
                  left: horizontalPadding,
                  right: horizontalPadding,
                ),
                height: verticalPadding,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  left: horizontalPadding,
                  right: horizontalPadding,
                ),
                height: verticalPadding,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding - 60,
              ),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                child: Text(
                  "Coloque seu rosto no centro da tela",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
