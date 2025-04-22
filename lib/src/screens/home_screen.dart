//
// home_screen.dart
//
// This is the landing page for all users
// when starting the app.
//

// External Libraries
import 'package:table_calendar/table_calendar.dart';
// Asset Imports
import '../assets/essential.dart';
// Screen Imports
import '../screens/card_screen.dart';
// Widget Imports
import '../widgets/button_grid.dart';
import '../widgets/course_selector.dart';
import '../widgets/horizontal_scroll.dart';
import '../widgets/route_handler.dart';
import '../widgets/statistics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<HorizontalScrollState> scrollState =
      GlobalKey<HorizontalScrollState>();
  final GlobalKey<StatsState> statsState = GlobalKey<StatsState>();
  //late String? statText;
  late String? currentName;
  // Access users sets from database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageStack(
        children: [
          CourseSelector(),
          // Horizontal Scroll for Sets
          HorizontalScroll(key: scrollState),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentName = scrollState.currentState?.currentSet;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            CardScreen(setName: currentName.toString()),
                  ),
                );
              });
            },
            child: Text("Select"),
          ),
          // Quick Action Button Grid
          ButtonGrid(
            buttons: [
              {
                'icon': Icons.person,
                'label': 'Solo Study',
                'route': '/flashcards',
              },
            ],
          ),
          // Calendar
          TableCalendar(
            calendarFormat: CalendarFormat.twoWeeks,
            focusedDay: DateTime.now(),
            firstDay: DateTime(2025, 1, 1),
            lastDay: DateTime(2025, 5, 5),
          ),
          // Course Statistics
          Statistics(key: statsState),
        ],
      ),
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
