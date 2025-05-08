//
// add_hint_screen.dart
//
//screen for adding hint for flashcards.


import 'package:flutter/material.dart';
import './flashcard_screen.dart';

class AddHintScreen extends StatelessWidget{
  const AddHintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController hintController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Hint'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Commit hint and go back
              Navigator.pop(context);
            },
            )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // (small improvement: uniform padding)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
        'Back of card',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: hintController,
                decoration: const InputDecoration(
                  hintText: 'Type your hint here...',
                  border: OutlineInputBorder(),
                ),
              ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const[
                    Expanded(
                      child: HintButton(label: 'Wrong', color: Colors.red),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child:HintButton(label: 'close', color: Colors.orange),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child:HintButton(label: 'close enough', color: Colors.yellow),
                      ),
                    SizedBox(width: 8),
                    Expanded(
                      child:HintButton(label: 'correct', color: Colors.green),
                      ),
                  ],
                ),
          ],
        ),
      ),
      ),
    );
  }
}
class HintButton extends StatelessWidget {
  final String label;
  final Color color;

  const HintButton({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
   return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8), //(slightly bigger padding)
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center( // (center text properly inside button)
    child: Text(
      label,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        ),
    ),
    ),
    );
  }
}