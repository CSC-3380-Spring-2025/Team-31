// 
// home_screen.dart
// 
// This is the landing page for all users
// when starting the app.
// 

import 'package:flashcard_app/src/widgets/card.dart';
import 'package:flashcard_app/src/widgets/horizontal_scroll.dart';

import '../widgets/essential.dart';
import '../widgets/custom_page_header.dart';
import '../widgets/custom_button_shelf.dart';
import '../widgets/horizontal_scroll.dart';


// Primary Screen Layout
class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
{
  final GlobalKey<HorizontalScrollState> scrollState = GlobalKey<HorizontalScrollState>();
  // Access users sets from database

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: (Text("Select a Set"))) ,
      body: Column(
        children: [HorizontalScroll(),
        ],
      )
      );
    
  }
}