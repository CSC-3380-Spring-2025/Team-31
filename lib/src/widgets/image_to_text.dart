import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';


class ImageToText {
  final ImagePicker _pickImage = ImagePicker();
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  Future<String?> pullTextFromImage() async{
      final XFile? pickerImage = await _pickImage.pickImage(
          source: ImageSource.gallery);
      if (pickerImage == null) {
        return null;
      }
      final InputImage inputImage = InputImage.fromFilePath(pickerImage.path);
      final RecognizedText scannedText = await textRecognizer.processImage(inputImage);
      await textRecognizer.close();
      return scannedText.text;
  }
  Future<String?> pullTextFromCamera() async{
    final XFile? pickerImage = await _pickImage.pickImage(
      source: ImageSource.camera);
    if (pickerImage == null) {
      return null;
    }
    final InputImage inputImage = InputImage.fromFilePath(pickerImage.path);
    final RecognizedText scannedText = await textRecognizer.processImage(inputImage);
    await textRecognizer.close();
    return scannedText.text;
    }
  }
