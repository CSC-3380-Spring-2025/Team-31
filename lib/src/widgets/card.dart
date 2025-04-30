// 
// card.dart
// 
// This is a card
//

import '../assets/essential.dart';
import '../assets/essential.dart';


class FlashCard extends StatefulWidget{
  final String setName; // Set Names


  FlashCard({super.key}) : setName = "";

  @override
  State<FlashCard> createState() => FlashCardState();
}

class FlashCardState extends State<FlashCard>
{
  List<String> frontBulletPoints=[];
  List<String> backBulletPoints=[];

  String text = "";
  bool selected = false; // if on home screen show Set Name
  int card = 1, side = 0;

  void changeText(String txt)
  {
    setState(() {
      text = txt;
    });
  }
  void addFrontBullet(String bullet) {
    setState((){
      frontBulletPoints.add(bullet);
    });
  }
  void addBackBullet(String bullet) {
    setState((){
      backBulletPoints.add(bullet);
    });
  }
  void removeFrontBullet(List<String> bulletPoints, int index){
    setState(() {
      bulletPoints.removeAt(index);
    });
  }
  void removeBackBullet(List<String> bulletPoints, int index){
    setState(() {
      bulletPoints.removeAt(index);
    });
  }
  List<String> getFrontBulletPoints() => frontBulletPoints;
  List<String> getBackBulletPoints() => backBulletPoints;

  void clearBack() {
    setState((){
      backBulletPoints.clear();
    });
  }
  void clearFront() {
    setState((){
      frontBulletPoints.clear();
    });
  }
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
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.green
        ),
        width: cardWidth,
        height: 200,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Text(setName)
       )
    );
  }
}

class CardPreview extends StatelessWidget {
  final String title;
  final List<String> bulletPoints;
  CardPreview({super.key, required this.title, required this.bulletPoints});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      height: MediaQuery.of(context).size.height *.25,
      margin: const EdgeInsets.all(8),
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Expanded(
            child: ListView(
              children: bulletPoints.map((bullet) => Text("- $bullet")).toList(),
            )
          )
        ]
      ),
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