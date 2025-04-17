
import 'package:flashcard_app/src/widgets/essential.dart';
import 'package:flashcard_app/src/widgets/card.dart';

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
  State<HorizontalScroll> createState() => _HorizontalScrollState();
}

class _HorizontalScrollState extends State<HorizontalScroll>
{
  List<Widget> sets = <Widget>[FlashCard(), FlashCard(), FlashCard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: sets 
        )
      )
    );
  }
}