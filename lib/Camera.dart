import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'globals.dart' as globals;
import 'LiveEventView.dart';
import 'main.dart';

class StoryCamera extends StatefulWidget {
  final List<CameraDescription>? cameras;
  final Event event;
  const StoryCamera({Key? key, required this.cameras, required this.event})
      : super(key: key);

  @override
  State<StoryCamera> createState() => _StoryCameraState();
}

class _StoryCameraState extends State<StoryCamera> {
  //late List<CameraDescription> cameras;
  late CameraController _cameraController;

  int camDirection = 0;
  bool _isRearCameraSelected = true;
  Future startCamera(CameraDescription cameraDescription) async {
    //final cameras = await availableCameras();

    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: true,
    );
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;

        setState(() {}); //refresh camera
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  void initState() {
    super.initState();

    startCamera(widget.cameras![0]);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController.value.isInitialized) {
      return Scaffold(
        body: Stack(
          children: [
            CameraPreview(_cameraController),
            GestureDetector(
                onTap: () {
                  setState(() {
                    _isRearCameraSelected = !_isRearCameraSelected;
                  });
                  startCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
                },
                child: cameraButton(
                    Icons.flip_camera_ios_outlined, Alignment.bottomLeft)),
            GestureDetector(
                onTap: () async {
                  final file = await _cameraController.takePicture();

                  final newStory = Story(
                    image: file.path,
                    time: DateTime.now(),
                    user: "${globals.firtname} ${globals.lastname}",
                  );
                  // Add the new story to the list of stories
                  widget.event.stories.add(newStory);
                  Navigator.pop(context);

                  //shows path for pictures
                },
                child: cameraButton(
                    Icons.camera_alt_outlined, Alignment.bottomCenter)),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget cameraButton(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black26,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 10,
              )
            ]),
        child: Center(
            child: Icon(
          icon,
          color: Colors.black54,
        )),
      ),
    );
  }
}
