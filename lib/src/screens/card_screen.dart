


import '../widgets/essential.dart';
import '../widgets/card.dart';

class CardScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context){
      return Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: (){ print("clicked"); },
              child: FlashCard(text: 'Placeholder')
        ))
      );
  }
}
