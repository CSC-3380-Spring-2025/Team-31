/*One of our features is to pull text from an image. On a computer, this can be done from
a screenshot or an image sent from a phone. on the phone, this can be done from the camera itself, or from the
photo library. Most users will likely use the camera and build one card at a time.

the methods in this class can be called by create_card and edit_card screens.
 */
import 'package:flutter/cupertino.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

//class to pull text from an image from two possible sources: image file and camera image
class ImageToText {
  ImageToText._internal(){
    //set the text recognizer to recognize latin script
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  }
  //singleton instance
  static final ImageToText instance = ImageToText._internal();
  //create an image picker
  final ImagePicker _pickImage = ImagePicker();
  //set the text recognizer to recognize latin script
  late final textRecognizer = TextRecognizer();
  //method returns a future string or null from a selected image.
  Future<String?> pullTextFromImage() async{
    //creates the XFIle object to wait for the selection of image from a gallery or provides null if cancelled out
      final XFile? pickerImage = await _pickImage.pickImage(
          source: ImageSource.gallery);
      //if not image selected, pickerImage is null so return null
      if (pickerImage == null) {
        debugPrint('pickerImage null');
        return null;
      }
      //sets the inputImage to the image associated with the image at the path selcted from the ImagePicker
      final InputImage inputImage = InputImage.fromFilePath(pickerImage.path);
      //sets the recognized text to wait for the textrecognizer to process the image.
      debugPrint('about to await TextRecognizer in image_to_text');
      final RecognizedText scannedText = await textRecognizer.processImage(inputImage);
      debugPrint('line after await TextRecoginiser');
      //returns the scanned text
      return scannedText.text;
  }
  //same method as above, but the source image is from a camera image.
  Future<String?> pullTextFromCamera() async{
    //XFile pickerImage is from the camera. the rest of the method should match the method above
    final XFile? pickerImage = await _pickImage.pickImage(
      source: ImageSource.camera);
    if (pickerImage == null) {
      return null;
    }
    final InputImage inputImage = InputImage.fromFilePath(pickerImage.path);
    final RecognizedText scannedText = await textRecognizer.processImage(inputImage);
    return scannedText.text;
    }
    //
    void dispose(){
    textRecognizer.close();
    }
  }
