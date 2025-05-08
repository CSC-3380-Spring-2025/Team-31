//
// horizontal_scroll.dart
//
// This is the horizontal scroll widget
//


import 'package:study_hall/src/assets/essential.dart';
import 'package:study_hall/src/widgets/card.dart';

// class HorizontalScroll extends StatelessWidget{
//   //final List<Widget> scroll;

//   const HorizontalScroll({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.symmetric(vertical: 20),
//         height: 200,
//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           children: <Widget> [  
//             FlashCard(text: 'Set #1'),
//             FlashCard(text: 'Set #2'),
//             FlashCard(text: 'Set #3')
//           ], //Add Animated Container and Gesture Detector
//         )
//       )
//     );
//   }
// }


class HorizontalScroll extends StatefulWidget{

  const HorizontalScroll({super.key});

  @override
  State<HorizontalScroll> createState() => HorizontalScrollState();
}

class HorizontalScrollState extends State<HorizontalScroll>
{
  // Get Set names from database
  // Make a loop that creates the sets on homescreen
  List<Widget> sets = <Widget>[HomeScreenSet(setName: "Set #1"), HomeScreenSet(setName: "Set #2"), HomeScreenSet(setName: "Set #3")];
  List<String> setNames = ["Set #1", "Set #2", "Set #3"]; // Temporary list of Set Names
  late ScrollController scrollController;
  late String currentSet = "";

  @override
  void initState()
  {
    super.initState();
    currentSet = setNames[0];
    //print(currentSet);
    scrollController = ScrollController()
    ..addListener(() {
      //print("offset = ${scrollController.offset}");
      setCurrentSet();
      
    });
  }

  void setCurrentSet()
  {
    final cardWidth = MediaQuery.of(context).size.width * 0.9;
    for(int i = 0; i <= sets.length; i++) {
      if (scrollController.offset >= cardWidth * i) {
        setState(() {
          currentSet = setNames[i];
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 200,
        child: ListView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          children: sets 
        )
      );

  }
}