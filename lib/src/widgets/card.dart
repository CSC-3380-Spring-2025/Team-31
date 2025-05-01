// 
// card.dart
// 
// This is a card
//

import 'package:flutter/foundation.dart';
import '../assets/essential.dart';

class FlashCard extends StatefulWidget {
  FlashCard({super.key}) : setName = "";
  final String setName; // Set Names
  List<String> frontBulletPoints = [];
  List<String> backBulletPoints = [];
  //array lists for future addition of images, videos, or other style entries
  List<Object> frontNonTextElements = [];
  List<Object> backNonTextElements = [];

  @override
  State<FlashCard> createState() => FlashCardState();
//method to add a bullet point to front
  void addFrontBullet(String bullet) {
    frontBulletPoints.add(bullet);
  }
//method to add a bullet point to back
  void addBackBullet(String bullet) {
    backBulletPoints.add(bullet);
  }
//method to remove a bullet point from front at specified index
  void removeFrontBullet(List<String> bulletPoints, int index) {
    bulletPoints.removeAt(index);
  }
//method to remove a bullet point from back at a specified index
  void removeBackBullet(List<String> bulletPoints, int index) {
    bulletPoints.removeAt(index);
  }
//method to clear all bullet points from the back
  void clearBack() {
    backBulletPoints.clear();
  }
//method to clear all bullet points from the front
  void clearFront() {
    frontBulletPoints.clear();
  }
}

class FlashCardState extends State<FlashCard> {

  String text = "";
  bool selected = false; // if on home screen show Set Name
  int card = 1,
      side = 0;
  void changeText(String txt) {
    setState(() {
      text = txt;
      debugPrint('flashCardState activated');
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

  class HomeScreenSet extends StatelessWidget {
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
  //Card Preview class stores necessary information and build instructions to generate a card preview on a screen.
  class CardPreview extends StatelessWidget {
    final String title;
    //listeners so values can be updated by notifiers and properly rendered
    final ValueListenable<List<String>> cpBulletPoints;
    final ValueListenable<int> cpIndex;

    CardPreview({super.key, required this.title, required this.cpBulletPoints, required this.cpIndex});

    @override
    Widget build(BuildContext context) {
      return Container(
        width: MediaQuery
            .of(context)
            .size
            .width * .4,
        height: MediaQuery
            .of(context)
            .size
            .height * .25,
        margin: const EdgeInsets.all(8),
        color: Colors.grey[300],
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
          Expanded(
            // ValueListenable so that the bulletPoints render when changes made to the list
              child: ValueListenableBuilder<List<String>?>(
                  valueListenable: cpBulletPoints,
                  builder: (context, bullets, child) {
                    final items = bullets ?? <String>[];

                    return ListView(
                      //takes bullet points and maps them to an index
                      children: items.asMap().entries.map((entry)
                      {
                        int index = entry.key;
                        String bullet = entry.value;
                        //ValueListenable so boolean is tied to index and highlighted text changes as index changes
                        return ValueListenableBuilder<int>(
                          valueListenable: cpIndex,
                          builder: (context, currentIndex, child)
                          {
                            //makes the boolean true for the String with the map index that matches in the passed currentIndex
                            bool isHighlighted = index == currentIndex;
                            return Container(
                              //sets highlight color based on the bool value
                              color: isHighlighted ? Colors.cyanAccent : Colors
                                .transparent,
                              padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                              child: Text("- $bullet",
                                style: TextStyle(
                                  fontWeight: isHighlighted
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                  color: isHighlighted ? Colors.black12 : Colors
                                    .grey,
                              ),
                            ),
                          );
                        },
                        );
                    }).toList(),
                    );
                  }
              )
          )
          ]
        ),
      );
    }
  }

  class RecentMadeButton extends StatelessWidget {
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
class CourseButton extends StatelessWidget {
  const CourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text("Course"),
    );
  }
}
class Set extends StatefulWidget {
  Set({super.key}) : courseName = "";
  String courseName='';
  String setName='';
  List<FlashCard> cardList=[];
  @override
  State<Set> createState() => SetState();

 /* void changeSetName(String newName){
    setState((){
      setName = newName;
    });
  }
  void changeCourseName (String newName){
    setState(() {
      courseName = newName;
    });
  }
  void addCard(FlashCard card){
    setState(() {
      cardList.add(card);
    });*/
  }
//}

class SetState extends State<Set>{
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}