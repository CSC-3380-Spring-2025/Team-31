//
// tts.dart
//
// text to speech widget. 
// to be used for entering 
// text via microphone on 
// card creation screen
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../assets/essential.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Tts extends StatefulWidget {
  final String text;

  const Tts({super.key, required this.text});

  @override
  State<Tts> createState() => ttsState();
}

class ttsState extends State<Tts>
{
  FlutterTts _flutterTts = FlutterTts();
  late String txt = widget.text;

  @override
  void initState()
  {
    super.initState();
    initTTS();
  }

  void initTTS()
  {
    _flutterTts.getVoices.then((data) {
      try {
        List<Map> _voices = List<Map>.from(data);
      } catch (e) {
        print(e);
      }
    });
  }

  void setVoice()
  {
    setState(() {
      _flutterTts.setVoice({"name" : "Karen", "locale" : "en-AU"});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: FittedBox(
        child: FloatingActionButton(onPressed: () {
          _flutterTts.speak(txt);
        }, heroTag: null, child: Icon(Icons.speaker_phone)),
      )
    );
  }
}