//
// camera_screen.dart
//

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../widgets/card.dart';
import '../assets/essential.dart';
import 'package:flutter/material.dart';
import '../widgets/image_to_text.dart';
import 'package:flutter/foundation.dart';




class CameraScreen extends StatefulWidget {
  CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}
class _CameraScreenState extends State<CameraScreen> {
  @override
  String? _scannedText;
  int frontIndex = 0;
  int backIndex = 0;
  TextEditingController _textController = TextEditingController();

  final GlobalKey<_CameraScreenState> _cameraScreenKey = GlobalKey<
      _CameraScreenState>();
  final GlobalKey<FlashCardState> _flashCardKey = GlobalKey<FlashCardState>();

  Future<void> _handleCameraScan() async {
    final text = await ImageToText.instance.pullTextFromCamera();
    if (text != null) {
      setState(() {
        _scannedText = text;
        _textController.text = text;
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    ImageToText.instance.dispose();
    super.dispose();
  }

  void _addToFront() {
    final selection = _textController.selection;
    if (selection.start != -1 && selection.end != -1){
      final selectedText = _textController.text.substring(selection.start, selection.end);
      if (selectedText.trim().isNotEmpty) {
        _flashCardKey.currentState!.addFrontBullet(selectedText.trim());
      }
    }
  }
  void _addToBack() {
    final selection = _textController.selection;
    if (selection.start != -1 && selection.end != -1){
      final selectedText = _textController.text.substring(selection.start, selection.end);
      if (selectedText.trim().isNotEmpty) {
        _flashCardKey.currentState!.addBackBullet(selectedText.trim());
      }
    }

  }

  void _removeFromBack(int index) {
    if (_flashCardKey.currentState != null) {
      _flashCardKey.currentState?.removeBackBullet(
          _flashCardKey.currentState!.backBulletPoints, index);
    }
  }
  void _removeFromFront(int index) {
    if (_flashCardKey.currentState != null) {
      _flashCardKey.currentState?.removeFrontBullet(
          _flashCardKey.currentState!.frontBulletPoints, index);
    }
  }

  void _moveBulletPointSelector(String frontOrBack, String upOrDown) {
    if (frontOrBack == 'front') {
      if (upOrDown == 'up') {
        if (_cameraScreenKey.currentState!.frontIndex == 0) {
          if (_flashCardKey.currentState?.frontBulletPoints != null) {
            _cameraScreenKey.currentState!.frontIndex =
                _flashCardKey.currentState!.frontBulletPoints.length - 1;
          }
        }
        else {
          _cameraScreenKey.currentState!.frontIndex--;
        }
      }
      else if (upOrDown == 'down') {
        if (_flashCardKey.currentState?.frontBulletPoints != null) {
          if (_cameraScreenKey.currentState!.frontIndex ==
              _flashCardKey.currentState!.frontBulletPoints.length - 1) {
            _cameraScreenKey.currentState!.frontIndex = 0;
          }
          else {
            frontIndex++;
          }
        }
      }
    }
    else if (frontOrBack == 'back') {
      if (upOrDown == 'up') {
        if (_cameraScreenKey.currentState?.backIndex == 0) {
          if (_flashCardKey.currentState?.backBulletPoints != null) {
            backIndex = _flashCardKey.currentState!.backBulletPoints.length - 1;
          }
        }
        else {
          _cameraScreenKey.currentState!.backIndex--;
        }
      }
      else if (upOrDown == 'down') {
        if (_flashCardKey.currentState?.backBulletPoints != null) {
          if (_cameraScreenKey.currentState!.backIndex == _flashCardKey.currentState!.backBulletPoints.length - 1) {
            _cameraScreenKey.currentState!.backIndex = 0;
          }
          else {
            _cameraScreenKey.currentState!.backIndex++;
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //variables for the InputChip. On mobile devices, User will likely take pictures. on pc's they will likely scan text from screenshots
    String cameraLabel;
    Icon icon;
    if (kIsWeb) {
      cameraLabel = 'Image';
      icon = Icon(Icons.image);
    }
    else {
      cameraLabel = 'Camera';
      icon = Icon(Icons.camera_alt);
    }
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
                  label: Text(cameraLabel),
                  onPressed: _handleCameraScan,
                  avatar: icon,
                ),
                Chip(label: Text("√ Voice")),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardPreview(title: 'Preview front of card',
                  bulletPoints: _flashCardKey.currentState
                      ?.getFrontBulletPoints() ?? [],),
                CardPreview(title: 'Preview back of card',
                    bulletPoints: _flashCardKey.currentState
                        ?.getBackBulletPoints() ?? []),
              ],
            ),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Scanned Text (Select and Add):"),
                   const SizedBox(height:8),
                   TextField(
                  controller: _textController,
                  readOnly:false,
                  maxLines:null,
                  showCursor: true,
                  decoration: InputDecoration(
                    hintText: 'Scanned text will appear here...',
                  ),
                ),
                const SizedBox(height:8),
              ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputChip(
                  label: Text('Front'),
                  onPressed: () {
                    if (_cameraScreenKey.currentState?.frontIndex != null) {
                      _addToFront();
                    }
                  },
                  avatar: Icon(Icons.add),
                ),
                InputChip(
                  label: Text('Front'),
                  onPressed: () {
                    if (_flashCardKey.currentState?.frontBulletPoints != null) {
                      _removeFromFront(
                          _cameraScreenKey.currentState!.frontIndex);
                    }
                  },
                  avatar: Icon(Icons.remove),
                ),
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {
                    if (_scannedText != null) {
                      _moveBulletPointSelector('front', 'up');
                    }
                  },
                  avatar: Icon(Icons.arrow_upward),
                ),
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {
                    if (_scannedText != null) {
                      _moveBulletPointSelector('front', 'down');
                    }
                  },
                  avatar: Icon(Icons.arrow_downward),
                ),
                InputChip(
                  label: Text('Back'),
                  onPressed: () {
                    if (_cameraScreenKey.currentState?.backIndex != null) {
                      _addToBack();
                    }
                  },
                  avatar: Icon(Icons.add),
                ),
                InputChip(
                  label: Text('Back'),
                  onPressed: () {
                    if (_flashCardKey.currentState?.backBulletPoints != null) {
                      _removeFromBack(
                          _cameraScreenKey.currentState!.backIndex);
                    }
                  },
                  avatar: Icon(Icons.remove),
                ),
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {
                    if (_scannedText != null) {
                      _moveBulletPointSelector('back', 'up');
                    }
                  },
                  avatar: Icon(Icons.arrow_upward),
                ),
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {
                    if (_scannedText != null) {
                      _moveBulletPointSelector('back', 'down');
                    }
                  },
                  avatar: Icon(Icons.arrow_downward),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                4,
                    (index) => const CardFormatPreset(),
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
