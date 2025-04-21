// 
// card.dart
// 
// This is a card
//

import '../assets/essential.dart';

import '../assets/essential.dart';


class FlashCard extends StatefulWidget{ 
  final String setName; // Set Names

  const FlashCard({super.key}) : setName = "";
  
  @override
  State<FlashCard> createState() => FlashCardState();

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

class FlashCardState extends State<FlashCard>
{
  String text = "";

  bool selected = false; // if on home screen show Set Name
  int card = 1, side = 0;
  // void changeText()
  // {
  //   setState(() { 
  //     if(side == 0) { side+= 1;}
  //     else {side-=1;}
  //     });
  // }

  void changeText(String txt)
  {
    setState(() {
      text = txt;
    });
  }
  // void changeScreen()
  // {
  //  
  // }

  // void changeCard()
  // {
  //   setState(() {
  //     card+=1;
  //   });
  // }

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () { 
      //   changeText('hello');
      //   },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.green
        ),
        width: 350,
        height: 200,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Text(text)
      )
    );
  }
}

class HomeScreenSet extends StatelessWidget{
  final String setName;
  const HomeScreenSet({super.key, required this.setName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.green
        ),
        width: 350,
        height: 200,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Text(setName)
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
  // TODO: implement build 
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