import 'package:flashcard_app/src/widgets/essential.dart';
import 'package:flutter/cupertino.dart';

class FlashcardStudysessionScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Study Session')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Front of Card
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            color: Colors.blue[100],
            child: Column(
              children: [
                Text('Front of Card'),
                ElevatedButton(
                  onPressed: () {
                     //Show Hint Logic
                   },
                  child: Text('Show Hint'),
                  ),
              ],
              ),
          ),
        //Stats
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Card Stats'),
            Text('Session Stats'),
          ],
        ),
          ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
                  // Load previous card
                }),
                IconButton(icon: Icon(Icons.flip), onPressed: () {
                  // Flip Card Logic
             }),
             IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {
              // Load next card
  }),
  IconButton(icon: Icon(Icons.home), onPressed: () {
    Navigator.pop(context);
  }),
              ],
            ),
          ),
    );
  }
}