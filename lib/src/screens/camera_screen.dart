//
// camera_screen.dart
//
// This is the screen where users can
// use their camera to quickly create
// cards fro sets
//

import 'package:flutter/cupertino.dart';
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
  late int frontIndex = -1;
  late int backIndex = -1;

  //text editing controller to help select text from scanned image, voice, or manual entry
  final TextEditingController _textController = TextEditingController();

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
//method to add highlighted input text as bullet point to front bullet point list and update listener
  void _addToFront(FlashCard card) {
    final selection = _textController.selection;
    if (selection.start != -1 && selection.end != -1) {
      final selectedText = _textController.text.substring(
        selection.start,
        selection.end,
      );
      if (selectedText.trim().isNotEmpty) {
        card.addFrontBullet(selectedText.trim());
        frontBulletPointsNotifier.value = card.frontBulletPoints.toList();
        frontIndex = -1;
        indexFrontNotifier.value = frontIndex;
      }
    }
  }
  //method to add highlighted text as bullet point to back bullet point list and update listener
  void _addToBack(FlashCard card) {
    final selection = _textController.selection;
    if (selection.start != -1 && selection.end != -1) {
      final selectedText = _textController.text.substring(
          selection.start,
          selection.end,
      );
      if (selectedText.trim().isNotEmpty) {
        card.addBackBullet(selectedText.trim());
        backBulletPointsNotifier.value = card.backBulletPoints.toList();
        backIndex=-1;
        indexBackNotifier.value = backIndex;
      }
    }
  }
  //method to remove bullet point at a set index from back bullet point list and update listener
  void _removeFromBack(int index, FlashCard card) {
    if (card.backBulletPoints.isNotEmpty && index != -1) {
      card.removeBackBullet(card.backBulletPoints, index);
      backBulletPointsNotifier.value = card.backBulletPoints.toList();
      backIndex = -1;
      indexBackNotifier.value = backIndex;
    }
  }
  //method to remove bullet point at a set index from front bullet point list and update listener
  void _removeFromFront(int index, FlashCard card) {
    if (card.frontBulletPoints.isNotEmpty && index !=-1 ) {
      card.removeFrontBullet(card.frontBulletPoints, index);
      frontBulletPointsNotifier.value = card.frontBulletPoints.toList();
      frontIndex = -1;
      indexFrontNotifier.value = frontIndex;
    }
  }
// method to move bullet point selector for the card preview on camera_screen. needs to know which card preview(frontOrBack), which direction(upOrDown), and which card's data
  void _moveBulletPointSelector(
      String frontOrBack,
      String upOrDown,
      FlashCard card) {
    //debugPrint('moveBulletPoint pre index ='+ frontOrBack+' '+'front'+_cameraScreenKey.currentState!.frontIndex.toString() +' back '+_cameraScreenKey.currentState!.backIndex.toString());
    if (frontOrBack == 'front') {
      if (upOrDown == 'up') {
        if (frontIndex == -1 && card.frontBulletPoints.isNotEmpty) {
          frontIndex = card.frontBulletPoints.length - 1;
          indexFrontNotifier.value = frontIndex;
        }
        else if (frontIndex == 0 && card.frontBulletPoints.length - 1 == 0) {
          frontIndex = 0;
          indexFrontNotifier.value = frontIndex;
        }
        else if (frontIndex == 0 && card.frontBulletPoints.length > 1) {
          frontIndex = card.frontBulletPoints.length - 1;
          indexFrontNotifier.value = frontIndex;
        }
        else {
          frontIndex--;
          indexFrontNotifier.value = frontIndex;
        }
      }
      else if (upOrDown == 'down') {
        if (frontIndex == -1 && card.frontBulletPoints.isNotEmpty) {
          frontIndex++;
          indexFrontNotifier.value = frontIndex;
        }
        else if (frontIndex >= card.frontBulletPoints.length - 1) {
          frontIndex = 0;
          indexFrontNotifier.value = frontIndex;
        }
        else {
          frontIndex++;
          indexFrontNotifier.value = frontIndex;
        }
      }
    }
    else if (frontOrBack == 'back') {
      if (upOrDown == 'up') {
        if (backIndex == -1 && card.backBulletPoints.isNotEmpty) {
          backIndex = card.backBulletPoints.length - 1;
          indexBackNotifier.value = backIndex;
        }
        else if (backIndex == 0 && card.backBulletPoints.length - 1 == 0) {
          backIndex = 0;
          indexBackNotifier.value = backIndex;
        }
        else if (backIndex == 0 && card.backBulletPoints.length > 1) {
          backIndex = card.backBulletPoints.length - 1;
          indexBackNotifier.value = backIndex;
        }
        else {
          backIndex--;
          indexBackNotifier.value = backIndex;
        }
      }
      else if (upOrDown == 'down') {
        if (backIndex == -1 && card.backBulletPoints.isNotEmpty) {
          backIndex++;
          indexBackNotifier.value = backIndex;
        }
        else if (backIndex >= card.backBulletPoints.length - 1) {
          backIndex = 0;
          indexBackNotifier.value = backIndex;
        }
        else {
          backIndex++;
          indexBackNotifier.value = backIndex;
        }
      }
    }
  }

  FlashCard newCard = FlashCard();
  final ValueNotifier<List<String>> frontBulletPointsNotifier = ValueNotifier(<String>[]);
  final ValueNotifier<List<String>> backBulletPointsNotifier = ValueNotifier(<String>[]);
  ValueNotifier<int> indexFrontNotifier = ValueNotifier(-1);
  ValueNotifier<int> indexBackNotifier = ValueNotifier(-1);

  @override
  Widget build(BuildContext context) {
    //variables for the InputChip. On mobile devices, User will likely take pictures. on pc's they will likely scan text from screenshots
    String cameraLabel;
    Icon icon;

    if (kIsWeb) {
      cameraLabel = 'Image';
      icon = Icon(Icons.image);
    } else {
      cameraLabel = 'Camera';
      icon = Icon(Icons.camera_alt);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Input'),
        centerTitle: true, //(small improvement: center title)
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [Column(
          crossAxisAlignment:
              CrossAxisAlignment
                  .start, // (small improvement:  more natural alignment)
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
                //front Card Preview
                CardPreview(
                  title: 'Preview front of card',
                  cpBulletPoints: frontBulletPointsNotifier,
                  cpIndex: indexFrontNotifier),
                //Back card preview
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
                const SizedBox(height: 8),
                TextField(
                  controller: _textController,
                  readOnly: false,
                  maxLines: null,
                  showCursor: true,
                  decoration: InputDecoration(
                    hintText: 'Scanned text will appear here...',
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
            Container(
              height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //add to front
                InputChip(
                  label: Text('Front'),
                  onPressed: () {
                    _addToFront(newCard);
                    CardPreview(title: newCard.toString(),
                        cpBulletPoints: frontBulletPointsNotifier,
                        cpIndex: indexFrontNotifier);
                  },
                  avatar: Icon(Icons.add),
                ),
                //remove from front
                InputChip(
                  label: Text('Front'),
                  onPressed: () {
                      _removeFromFront(frontIndex, newCard);
                      frontIndex=-1;
                      indexFrontNotifier.value = frontIndex;
                  },
                  avatar: Icon(Icons.remove),
                ),
                //front bullet index up
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {
                      _moveBulletPointSelector('front', 'up', newCard);
                  },
                  avatar: Icon(Icons.arrow_upward),
                ),
                //front bullet index down
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {debugPrint('front bullet index down'+ frontIndex.toString());
                      _moveBulletPointSelector('front', 'down', newCard);
                  },
                  avatar: Icon(Icons.arrow_downward),
                ),
                //Add selected text as bullet to back of card preview
                InputChip(
                  label: Text('Back'),
                  onPressed: () {
                    debugPrint('add to back pressed');
                      _addToBack(newCard);
                  },
                  avatar: Icon(Icons.add),
                ),
                //remove bullet at selected index from back of card
                InputChip(
                  label: Text('Back'),
                  onPressed: () {
                    if (newCard.backBulletPoints.isNotEmpty) {
                      _removeFromBack(
                        backIndex,
                        newCard,
                      );
                    }
                  },
                  avatar: Icon(Icons.remove),
                ),
                //move bullet point selected index up one. wraps around to the bottom when out of range upwards
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {
                      _moveBulletPointSelector('back', 'up', newCard);
                  },
                  avatar: Icon(Icons.arrow_upward),
                ),
                //move bullet point selected index down one. wraps around to the top when out of range downwards
                InputChip(
                  label: Text('Bullet'),
                  onPressed: () {
                      _moveBulletPointSelector('back', 'down', newCard);
                  },
                  avatar: Icon(Icons.arrow_downward),
                ),
              ],
            ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                RecentMadeButton(),
                CircleAvatar(radius: 30, backgroundColor: Colors.grey),
                CourseButton(),
              ],
            ),
          ],
        )],
      ),
    );
  }
}
