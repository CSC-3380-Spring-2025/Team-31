// 
// card.dart
// 
// This is a card
//

import './essential.dart';

class FlashCard extends StatefulWidget{ 
  // final String text; // front of card

  const FlashCard({
    super.key,
    //required this.text
  });
  
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
  var contents = [["Set Name", "N/A"],["front placeholder", "back placeholder"],
                  ["front placeholder 2", "back placeholder 2"]]; // 2d array each element contains front a back text of a card

  bool selected = false; // if on home screen show Set Name
  int x = 0, y = 0;
  void changeText()
  {
    setState(() { 
      if(!selected) {x = 0; y = 0; selected = true;}
      else {x = 1; y = 0;}});
  }

  void changeCard()
  {
    setState(() {});
  }

  
  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: 350,
      height: 200,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.green,
      child: Text(contents[x][y])
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