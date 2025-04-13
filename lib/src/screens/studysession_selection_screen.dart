import 'flashcard_studysession_screen.dart';
import '../widgets/essential.dart';
import '../widgets/card.dart';

class StudysessionSelectionScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Study Session')),
      body: Column(
        children: [
          //Course Cards Section
          Expanded(
            child:ListView(
              children: [
                ListTile(title: Text('Chapter 1')),
                ListTile(title: Text('Chapter 2')),
                ListTile(title: Text('Chapter 3')),
              ],
            ),
            ),
            Divider(),
            //Session Cards Section
            Expanded(
              child: ListView(
              children: [
                ListTile(title: Text('Chapter 2.1')),
                ListTile(title: Text('Chapter 2.2')),
                ListTile(title: Text('Chapter 2.3')),
        ],
      ),
    ),
    ],
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.play_arrow),
      onPressed: (){
        Navigator.push(
          context,
           MaterialPageRoute(builder: (context) => FlashcardStudyScreen()),
        );
      },
    ),
    bottomNavigationBar: BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: Icon(Icons.home), onPressed: () {
            Navigator.pop(context);
          }),
        ],
      ),
    ),
    );
  }
}
       