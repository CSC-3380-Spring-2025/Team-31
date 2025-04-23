// 
// home_screen.dart
// 
// This is the landing page for all users
// when starting the app.
// 

import '../screens/card_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/card.dart';
import '../widgets/horizontal_scroll.dart';
import '../widgets/statistics.dart';
import '../widgets/route_handler.dart';

import '../assets/essential.dart';
import '../widgets/custom_page_header.dart';
import '../widgets/custom_button_shelf.dart';
import '../widgets/course_shelf.dart';
import '../widgets/button_grid.dart';
import '../widgets/custom_calendar.dart';

// Primary Screen Layout
class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<HorizontalScrollState> scrollState = GlobalKey<HorizontalScrollState>();
  final GlobalKey<StatsState> statsState = GlobalKey<StatsState>();
  //late String? statText;
  late String? currentName;
  // Access users sets from database

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: (Text("Select a Set"))) ,
      body: CustomPageStack(
        children: [
          HorizontalScroll(key: scrollState),
          ElevatedButton(onPressed: () {
            setState(() {
               currentName = scrollState.currentState?.currentSet;
               Navigator.push(context, MaterialPageRoute(builder: (context) => CardScreen(setName: currentName.toString())));
            });
          }, 
          child: Text("Select")),
          ButtonGrid(
            buttons: [
              {
                'icon': Icons.person, 
                'label': 'Solo Study',
                'route': '/flashcards'
              },
            ]
          ),
          CustomCalendar(),
          Statistics(key: statsState),
        ],
              )
      );
  }
    
  // Old Home Screen
  // Widget build(BuildContext context) {
  //   return CustomPageStack(
  //     children: [
  //       CustomPageHeader(
  //         text: "Home Page"
  //       ),
  //       CustomButtonShelf(
  //         label: "Quick Actions",
  //       ),
  //       CourseShelf()
  //     ]
  //   );
  // }
}