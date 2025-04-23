//
// camera_screen.dart
//

import '../widgets/card.dart';
import '../assets/essential.dart';
import 'package:flutter/material.dart';
import '../widgets/image_to_text.dart';


class CameraScreen extends StatefulWidget {
  CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}
class _CameraScreenState extends State<CameraScreen> {
  @override
  String? _scannedText;

  Future<void> _handleCameraScan() async{
    final text = await ImageToText.instance.pullTextFromCamera();
    if (text!= null){
      setState((){
        _scannedText = text;
      });
    }
  }
  @override
  void dispose(){
    ImageToText.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardPreviewWidth = screenWidth * .3;
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Input')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InputChip(
                    label: Text("Camera"),
                    onPressed: _handleCameraScan,
                    avatar: Icon(Icons.camera_alt),
                ),
                Chip(label: Text("Image")),
                Chip(label: Text("√ Voice")),
              ],
            ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardPreview(title: 'Preview front of card', bulletPoints: ['first','second'], ),
              CardPreview(title: 'Preview back of card', bulletPoints:['first','second','third']),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing:8,
            runSpacing:8,
            children: List.generate(
              4,
              (index)=> const CardFormatPreset(),
            ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                RecentMadeButton(),
                CircleAvatar(radius: 30, backgroundColor: Colors.grey),
                CourseButton(),
              ],
            ),
          ],
          ),
      ),
        );
     }
}