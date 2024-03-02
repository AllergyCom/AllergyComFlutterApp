import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class OcrCamera extends StatefulWidget {
  final Function(List<String>) onFoodAdditivesDetected;

  OcrCamera({required this.onFoodAdditivesDetected});

  @override
  _OcrCameraState createState() => _OcrCameraState();
}

class _OcrCameraState extends State<OcrCamera> {
  late CameraController _cameraController;
  late CameraDescription _cameraDescription;

  late TextRecognizer _textRecognizer;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _textRecognizer = GoogleMlKit.vision.textRecognizer();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraDescription = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
    );

    _cameraController = CameraController(
      _cameraDescription,
      ResolutionPreset.high,
    );

    _cameraController.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
      _cameraController.startImageStream((image) => _processImage(image));
    });
  }

  void _processImage(CameraImage image) async {
  final inputImageData = InputImageData(
    size: Size(image.width.toDouble(), image.height.toDouble()),
    imageRotation: InputImageRotation.rotation0deg,
    inputImageFormat: InputImageFormat.yuv420, // Specify the format
    planeData: image.planes.map(
      (plane) => InputImagePlaneMetadata(
        bytesPerRow: plane.bytesPerRow,
        height: plane.height,
        width: plane.width,
      ),
    ),
  );

  // Use the created inputImageData in InputImage
  final inputImage = InputImage.fromBytes(
    bytes: image.planes[0].bytes,
    inputImageData: inputImageData,
  );

    final RecognizedText recognisedText =
        await _textRecognizer.processImage(inputImage);
    final foodAdditives = _extractFoodAdditives(recognisedText);

    if (foodAdditives.isNotEmpty) {
      widget.onFoodAdditivesDetected(foodAdditives);
    }
  }

  List<String> _extractFoodAdditives(RecognizedText recognisedText) {
    List<String> foodAdditives = [];
    final pattern = RegExp(r'E\d{3,4}');

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          if (pattern.hasMatch(element.text)) {
            foodAdditives.add(element.text);
          }
        }
      }
    }

    return foodAdditives;
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Container();
    }

    return AspectRatio(
      aspectRatio: _cameraController.value.aspectRatio,
      child: CameraPreview(_cameraController),
    );
  }
}
