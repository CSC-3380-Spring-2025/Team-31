// 
// card.dart
// 
// This is a card
//

import '../assets/essential.dart';

class FlashCard extends StatelessWidget{ 
  final String text; // front of card

  const FlashCard({
    super.key,
    required this.text
  });
  
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 400,
      height: 200,
      alignment: Alignment.center,
      color: Colors.green,
      child: Text(text)
    );
  }

}

class CardPreview extends StatelessWidget{
  final String title;
  const CardPreview({required this.title});

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
  const CardFormatPreset();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height:70,
      color: Colors.grey[400],
      margin: const EdgeInsets.all(4),
    );
  }// TODO: implement build 
}

class RecentMadeButton extends StatelessWidget{
  const RecentMadeButton();
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
  const CourseButton();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

      },
      child: const Text("Course"),
   );
   }
}