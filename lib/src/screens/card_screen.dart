// 
// card_screen.dart
// 
// This is a simple framework card screen.
//


import '../widgets/essential.dart';
import '../widgets/card.dart';
import 'dart:math';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return CustomPageStack(
  //     children: [
  //       CustomPageHeader(
  //         text: "Card #1"
  //       ),
  //     ]
  //   );
  // }

  // @override
  // Widget build(BuildContext context){
  //     return Scaffold(
  //       body: Center(
  //         child: GestureDetector(
  //           onTap: (){ 
  //             print("clicked"); 
  //           },
  //           child: FlashCard(text: 'Placeholder')
  //       ))
  //     );
  // }

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen>
with TickerProviderStateMixin
{
  final GlobalKey<FlashCardState> cardKey = GlobalKey<FlashCardState>();
  // Placeholder for card contents from database
  // add check for array size 
  var contents = [["front placeholder", "back placeholder"],
                  ["front placeholder 2", "back placeholder 2"],
                  ["front placeholder 3", "back placeholder 3"]]; 
  
  int card = 0;
  int side = 0;
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isflipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1),vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Set Name")),
        body: Column(
          children: [GestureDetector(
          onTap: () => setState(() {
            //isflipped = !isflipped;
            if(side == 0) {side+=1;}
            else {side-=1;}
            cardKey.currentState?.changeText(contents[card][side]);
            _controller.forward();
          }),
          child: MatrixTransition(animation: _animation,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: FlashCard(key: cardKey),
          ),
          onTransform: (double value) {
            { return Matrix4.identity()
            ..setEntry(3, 2, 0.004)
            ..rotateY(pi * 2.0 * value);}
            
          }
        )
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
          onPressed: () {
            card-=1;
            side=0;
            cardKey.currentState?.changeText(contents[card][side]);
          }, 
          child: Text("Previous")),
          ElevatedButton(
          onPressed: () {
            card+=1;
            side=0;
            cardKey.currentState?.changeText(contents[card][side]);
          }, 
          child: Text("Next"))
        ]
      ),  
      ],
      )
        // body: Column(
        //   children: [
        //   FlashCard(key: cardKey),
        //   ElevatedButton(onPressed: () {
        //     card+=1;
        //     cardKey.currentState?.changeText(contents[card][side]);
        //     }, 
        //   child: Text("Next"))
        //   ]
        // )
    );
  }

  
}
