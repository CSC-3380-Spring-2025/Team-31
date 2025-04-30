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
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}
class _CameraScreenState extends State<CameraScreen> {
  @override
  String? _scannedText;
  int frontIndex = -1;
  int backIndex = -1;
  //text editing controller to help select text from scanned image, voice, or manual entry
  final TextEditingController _textController = TextEditingController();
//
  final GlobalKey<_CameraScreenState> _cameraScreenKey = GlobalKey<
      _CameraScreenState>();
  //takes image from camera on mobile devices, enters it into text variable, then updates text scanner and text controller while setting state
  Future<void> _handleCameraScan() async {
    final text = await ImageToText.instance.pullTextFromCamera();
    if (text != null) {
      setState(() {
        _scannedText = text;
        _textController.text = text;
      });
    }
  }
//disposes text controller and image to text once no longer needed
  @override
  void dispose() {
    _textController.dispose();
    ImageToText.instance.dispose();
    super.dispose();
  }
//method to add highlighted bullet point to front bullet point list and update listener
  void _addToFront(FlashCard card) {
    final selection = _textController.selection;
    if (selection.start != -1 && selection.end != -1){
      final selectedText = _textController.text.substring(selection.start, selection.end);
      if (selectedText.trim().isNotEmpty) {
        card.addFrontBullet(selectedText.trim());
        frontBulletPointsNotifier.value=card.frontBulletPoints.toList();
      }
    }
  }
  //method to add highlighted bullet point to back bullet point list and update listener
  void _addToBack(FlashCard card) {
    final selection = _textController.selection;
    if (selection.start != -1 && selection.end != -1) {
      final selectedText = _textController.text.substring(
          selection.start, selection.end);
      if (selectedText
          .trim()
          .isNotEmpty) {
        card.addBackBullet(selectedText.trim());
        backBulletPointsNotifier.value = card.backBulletPoints.toList();
      }
    }
  }
  //method to remove bullet point at a set index from back bullet point list and update listener
  void _removeFromBack(int index, FlashCard card) {
    if (card.backBulletPoints != [] && index != -1) {
      card.removeBackBullet(card.backBulletPoints, index);
      backBulletPointsNotifier.value = card.backBulletPoints.toList();
    }
  }
  //method to remove bullet point at a set index from front bullet point list and update listener
  void _removeFromFront(int index, FlashCard card) {
    if (card.frontBulletPoints != [] && index !=-1 ) {
      card.removeFrontBullet(card.frontBulletPoints, index);
      frontBulletPointsNotifier.value = card.frontBulletPoints.toList();
    }
  }
// method to move bullet point selector for the card preview on camera_screen. needs to know which card preview(frontOrBack), which direction(upOrDown), and which card's data
  void _moveBulletPointSelector(
      String frontOrBack,
      String upOrDown,
      FlashCard card) {
    if (frontOrBack == 'front') {
      if (upOrDown == 'up') {
        if (_cameraScreenKey.currentState!.frontIndex == -1) {
          if (card.frontBulletPoints != []) {
            _cameraScreenKey.currentState!.frontIndex =
                card.frontBulletPoints.length - 1;
            frontIndex = _cameraScreenKey.currentState!.frontIndex;
          }
        }
        else if (_cameraScreenKey.currentState!.frontIndex == 0 &&
            card.frontBulletPoints.length - 1 == 0) {
          frontIndex = 0;
        }
        else {
          _cameraScreenKey.currentState!.frontIndex--;
          frontIndex = _cameraScreenKey.currentState!.frontIndex;
        }
      }
      else if (upOrDown == 'down') {
        if (card.frontBulletPoints != []) {
          if (_cameraScreenKey.currentState!.frontIndex ==
              card.frontBulletPoints.length - 1) {
            _cameraScreenKey.currentState!.frontIndex = 0;
            frontIndex = _cameraScreenKey.currentState!.frontIndex;
          }
          else {
            frontIndex++;
            frontIndex = _cameraScreenKey.currentState!.frontIndex;
          }
        }
      }
      debugPrint('frontIndex= '+frontIndex.toString()+ 'cameraScreenKey.front index = '+_cameraScreenKey.currentState!.frontIndex.toString());
    }
    else if (frontOrBack == 'back') {
      if (upOrDown == 'up') {
        if (_cameraScreenKey.currentState?.backIndex == -1) {
          if (_cameraScreenKey.currentState?.backIndex == 0) {
            if (card.backBulletPoints != []) {
              backIndex = card.backBulletPoints.length - 1;
              frontIndex = _cameraScreenKey.currentState!.backIndex;
            }
          }
          else {
            _cameraScreenKey.currentState!.backIndex--;
            backIndex = _cameraScreenKey.currentState!.backIndex;
          }
        }
        else if (upOrDown == 'down') {
          if (card.backBulletPoints != []) {
            if (_cameraScreenKey.currentState!.backIndex ==
                card.backBulletPoints.length - 1) {
              _cameraScreenKey.currentState!.backIndex = 0;
              backIndex = _cameraScreenKey.currentState!.backIndex;
            }
            else {
              _cameraScreenKey.currentState!.backIndex++;
              backIndex = _cameraScreenKey.currentState!.backIndex;
            }
          }
        }
      }
    }
    debugPrint('backIndex= '+backIndex.toString()+ 'cameraScreenKey.back index = '+_cameraScreenKey.currentState!.backIndex.toString());
  }

  FlashCard newCard = FlashCard();
  final ValueNotifier<List<String>> frontBulletPointsNotifier = ValueNotifier(<String>[]);
  final ValueNotifier<List<String>> backBulletPointsNotifier = ValueNotifier(<String>[]);
  final ValueNotifier<int> indexFrontNotifier = ValueNotifier(0);
  final ValueNotifier<int> indexBackNotifier = ValueNotifier(0);

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
                CardPreview(
                  title: 'Preview front of card',
                  cpBulletPoints: frontBulletPointsNotifier,
                  cpIndex: indexFrontNotifier),

                CardPreview(
                    title: 'Preview back of card',
                    cpBulletPoints: backBulletPointsNotifier,
                    cpIndex: indexBackNotifier),
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
                    _addToFront(newCard);
                    frontIndex =-1;
                    CardPreview(title: newCard.toString(),
                        cpBulletPoints: frontBulletPointsNotifier,
                        cpIndex: indexFrontNotifier);
                   // didUpdateWidget(CameraScreen());
                    /*}*/
                  },
                  avatar: Icon(Icons.add),
                ),
                InputChip(
                  label: Text('Front'),
                  onPressed: () {
                    if (newCard.frontBulletPoints != []) {
                      _removeFromFront(
                          _cameraScreenKey.currentState!.frontIndex, newCard);
                      frontIndex=-1;
                    }
                  },
                  avatar: Icon(Icons.remove),
                ),
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {
                    if (_scannedText != null) {
                      _moveBulletPointSelector('front', 'up', newCard);
                    }
                  },
                  avatar: Icon(Icons.arrow_upward),
                ),
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {
                    if (_scannedText != null) {
                      _moveBulletPointSelector('front', 'down', newCard);
                    }
                  },
                  avatar: Icon(Icons.arrow_downward),
                ),
                InputChip(
                  label: Text('Back'),
                  onPressed: () {
                    debugPrint('add to back pressed');
                      _addToBack(newCard);
                  },
                  avatar: Icon(Icons.add),
                ),
                InputChip(
                  label: Text('Back'),
                  onPressed: () {
                    if (newCard.backBulletPoints != []) {
                      _removeFromBack(
                          _cameraScreenKey.currentState!.backIndex, newCard);
                    }
                  },
                  avatar: Icon(Icons.remove),
                ),
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {
                    if (_scannedText != null) {
                      _moveBulletPointSelector('back', 'up', newCard);
                    }
                  },
                  avatar: Icon(Icons.arrow_upward),
                ),
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {
                    if (_scannedText != null) {
                      _moveBulletPointSelector('back', 'down', newCard);
                    }
                  },
                  avatar: Icon(Icons.arrow_downward),
                ),
              ],
            ),
           /* const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                4,
                    (index) => const CardFormatPreset(),
              ),
            ),*/
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
