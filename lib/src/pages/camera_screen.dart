import 'package:camera/camera.dart';
import 'package:contact_app/src/pages/camera_view.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription>? camera;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  Future<void>? cameraValue;

  @override
  initState() {
    super.initState();
    _cameraController = CameraController(camera![0], ResolutionPreset.high);
    cameraValue = _cameraController?.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FutureBuilder(
                future: cameraValue,
                builder: (context, snapchat) {
                  if (snapchat.connectionState == ConnectionState.done) {
                    return CameraPreview(_cameraController!);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.flash_off,
                          size: 40,
                        ),
                        color: Colors.white,
                      ),
                      InkWell(
                          onTap: () {
                            takePhoto(context);
                          },
                          child: const Icon(
                            Icons.panorama_fish_eye,
                            color: Colors.white,
                            size: 40,
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.flip_camera_ios,
                          size: 40,
                        ),
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Hold for video, tap for photo",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    // final path =
    //     join((await getTemporaryDirectory()).path, "${DateTime.now()}");
    final file  = await _cameraController!.takePicture();

    Navigator.push(
        context, MaterialPageRoute(builder: (builder) =>  CameraView(file.path)));
  }
}
