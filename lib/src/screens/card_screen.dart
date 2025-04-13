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
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isflipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1),vsync: this)..animateTo(50);
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
            isflipped = !isflipped;
            print("clicked flip function");
          }),
          child: MatrixTransition(animation: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlashCard(),
          ),
          onTransform: (double value) {
            if (isflipped) {
            return Matrix4.identity()
            ..setEntry(3, 2, 0.004)
            ..rotateY(pi * 2.0 * value);
          }
          else 
          {return Matrix4.identity();}
          }

        )
        ),
        TextButton(onPressed: null, child: const Text('Next'))],

      )
    );
  }

  
}
