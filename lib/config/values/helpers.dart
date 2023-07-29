import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:neo_store/pages/pages.dart';

Future<void> openCamera(BuildContext context) async {
  // Get available cameras
  List<CameraDescription> cameras = await availableCameras();

  // Initialize the first camera
  CameraController cameraController =
      CameraController(cameras[0], ResolutionPreset.medium);

  try {
    // Initialize the camera
    await cameraController.initialize();

    // Open the camera preview
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(cameraController),
      ),
    );
  } catch (e) {
    // Handle camera initialization errors
    debugPrint("Error opening camera: $e");
  } finally {
    // Dispose of the camera controller when done
    cameraController.dispose();
  }
}
