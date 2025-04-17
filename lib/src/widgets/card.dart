// 
// card.dart
// 
// This is a card
//

import 'package:flashcard_app/main.dart';

import './essential.dart';
import '../../main.dart';

class FlashCard extends StatefulWidget{ 
  // final String text; // front of card

  const FlashCard({super.key });
  
  @override
  State<FlashCard> createState() => _FlashCardState();
    
  // @override
  // Widget build(BuildContext context) {
    
  //   return Container(
  //     width: 350,
  //     height: 200,
  //     alignment: Alignment.center,
  //     // margin: EdgeInsets.symmetric(horizontal: 10),
  //     color: Colors.green,
  //     child: Text(text)
  //   );
  // }

}

class _FlashCardState extends State<FlashCard>
{
  final GlobalKey<MainStateScreen> MainKey = GlobalKey<MainStateScreen>();
  // Placeholder set data
  var contents = [["Set Name", "N/A"],["front placeholder", "back placeholder"],
                  ["front placeholder 2", "back placeholder 2"]]; 

  bool selected = false; // if on home screen show Set Name
  int card = 1, side = 0;
  void changeText()
  {
    setState(() { 
      if(side == 0) { side+= 1;}
      else {side-=1;}
      });
  }

  // idk fix it later
  // void changeScreen()
  // {
  //   setState(() {
  //     MainKey.currentState?.onItemTapped(3);
  //   });
  // }

  // void changeCard()
  // {
  //   setState(() {
  //     card+=1;
  //   });
  // }

  
  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: () { 
        changeText();
        },
      child: Container(
      width: 350,
      height: 200,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.green,
      child: Text(contents[card][side])
      )
    );
  }
}


class CardPreview extends StatelessWidget{
  final String title;
  const CardPreview({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      margin: const EdgeInsets.all(8),
      color: Colors.grey[300],
      child: Center(child: Text(title)),
    );
  }
}

class CardFormatPreset extends StatelessWidget{
  const CardFormatPreset({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height:70,
      color: Colors.grey[400],
      margin: const EdgeInsets.all(4),
    );
  }
}

class RecentMadeButton extends StatelessWidget{
  const RecentMadeButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: Colors.grey,
      child: const Center(child: Text('Recent')),
    );
  }
}

class CourseButton extends StatelessWidget{
  const CourseButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

      },
      child: const Text("Course"),
   );
   }
}