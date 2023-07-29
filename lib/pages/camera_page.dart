import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  final CameraController cameraController;

  const CameraScreen(this.cameraController, {super.key});

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: AspectRatio(
                  aspectRatio: cameraController.value.aspectRatio,
                  child: CameraPreview(cameraController),
                ),
              ),
              Positioned(
                bottom: 10,
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          XFile img = await cameraController.takePicture();
                          debugPrint(img.toString());
                        },
                        child: SizedBox(
                          width: 72,
                          height: 72,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 72,
                                  height: 72,
                                  decoration: ShapeDecoration(
                                    color: Colors.white
                                        .withOpacity(0.6000000238418579),
                                    shape: const OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 6,
                                top: 6,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: const ShapeDecoration(
                                    color: Colors.white,
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 44,
                        height: 44,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
