import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class SSController {
  ScreenshotController screenshotController = ScreenshotController();

  void takeScreenshot(BuildContext context) {
    screenshotController
        .capture(delay: Duration(milliseconds: 10))
        .then((capturedImage) async {
      final result = await ImageGallerySaver.saveImage(capturedImage!);
      print(result);
      Navigator.of(context).pop();
      Fluttertoast.showToast(
          msg: "Saved image to Gallery", toastLength: Toast.LENGTH_LONG);
    }).catchError((onError) {
      print(onError);
    });
  }
}
