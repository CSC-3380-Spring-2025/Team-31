//
// home_screen.dart
//
// This is the landing page for all users
// when starting the app.
//

// External Libraries
import 'package:study_hall/src/widgets/section_label.dart';
import 'package:table_calendar/table_calendar.dart';
// Asset Imports
import '../assets/essential.dart';
import '../assets/database.dart';
// Screen Imports
import '../screens/card_screen.dart';
// Widget Imports
import '../widgets/button_grid.dart';
import '../widgets/course_selector.dart';
import '../widgets/course_set_scroll.dart';
import '../widgets/horizontal_scroll.dart';
import '../widgets/route_handler.dart';
import '../widgets/statistics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<HorizontalScrollState> scrollState = GlobalKey<HorizontalScrollState>();
  final GlobalKey<StatsState> statsState = GlobalKey<StatsState>();
  final ValueNotifier<String?> selectedCourseId = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageStack(
        children: [
          // Course Selector
          CourseSelector(selectedCourseId: selectedCourseId),
          
          // Set Display Section
          const SectionLabel(text: "Your Sets"),
          CourseSetScroll(selectedCourseId: selectedCourseId),
          
          // Quick Action Section
          const SectionLabel(text: "Quick Actions"),
          ButtonGrid(
            buttons: [
              {
                'icon': Icons.play_arrow,
                'label': 'Do Something',
                'route': '/',
              },
              {
                'icon': Icons.play_arrow,
                'label': 'Do Something',
                'route': '/',
              },
              {
                'icon': Icons.play_arrow,
                'label': 'Do Something',
                'route': '/',
              },
              {
                'icon': Icons.play_arrow,
                'label': 'Do Something',
                'route': '/',
              },
            ],
          ),
          
          // Calendar Section
          TableCalendar(
            calendarFormat: CalendarFormat.twoWeeks,
            focusedDay: DateTime.now(),
            firstDay: DateTime(2025, 1, 1),
            lastDay: DateTime(2025, 12, 31),
          ),
          
          // Statistics Section
          Statistics(key: statsState),
        ],
      ),
    );
  }
}