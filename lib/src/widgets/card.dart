// 
// card.dart
// 
// This is a card
//

import '../assets/essential.dart';

class FlashCard extends StatefulWidget {
  FlashCard({super.key}) : setName = "";
  final String setName; // Set Names
  List<String> frontBulletPoints = [];
  List<String> backBulletPoints = [];
  List<Object> frontNonTextElements=[];
  List<Object> backNonTextElements=[];
  @override
  State<FlashCard> createState() => FlashCardState();

  void addFrontBullet(String bullet) {
    frontBulletPoints.add(bullet);
  }

  void addBackBullet(String bullet) {
    backBulletPoints.add(bullet);
  }

  void removeFrontBullet(List<String> bulletPoints, int index) {
    bulletPoints.removeAt(index);
  }

  void removeBackBullet(List<String> bulletPoints, int index) {
    bulletPoints.removeAt(index);
  }

  void clearBack() {
    backBulletPoints.clear();
  }

  void clearFront() {
    frontBulletPoints.clear();
  }
}
class FlashCardState extends State<FlashCard> {

  //List<String> frontBulletPoints=[];
  //List<String> backBulletPoints=[];

  String text = "";
  bool selected = false; // if on home screen show Set Name
  int card = 1,
      side = 0;
  void changeText(String txt) {
    setState(() {
      text = txt;
    });
    //List<String> getFrontBulletPoints() => frontBulletPoints;
   // List<String> getBackBulletPoints() => backBulletPoints;


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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
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
  class CardPreview extends StatelessWidget {
    final String title;
    List<String> bulletPoints;
    //List<String> frontBulletPoints=[];
    //List<String> backBulletPoints=[];

    CardPreview({super.key, required this.title, required this.bulletPoints});
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
                  child: ListView(
                    children: bulletPoints.map((bullet) => Text("- $bullet"))
                        .toList(),
                  )
              )
            ]
        ),
      );
    }
  }
  /*class CardFormatPreset extends StatelessWidget {
    const CardFormatPreset({super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
        width: 70,
        height: 70,
        color: Colors.grey[400],
        margin: const EdgeInsets.all(4),
      );
    }
  // TODO: implement build
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
  }*/
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