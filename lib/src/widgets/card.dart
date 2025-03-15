



import './essential.dart';


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


