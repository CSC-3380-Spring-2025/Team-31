import 'package:table_calendar/table_calendar.dart';
import '../assets/essential.dart';


class CustomCalendar extends StatefulWidget{

  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => CustomCalendarState();
}

class Event {
  final String title;
  Event(this.title);
}

class CustomCalendarState extends State<CustomCalendar>
{
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier <List<Event>> _selectedEvents;
  @override
  void initState()
  {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  List<Event> _getEventsForDay(DateTime day)
  {
    return events[day] ?? []; 
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
    if(!isSameDay(_selectedDay, focusedDay)) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
    children: [TableCalendar(
      headerStyle: HeaderStyle(
        formatButtonVisible: false
      ),
      calendarFormat: CalendarFormat.twoWeeks,
      focusedDay: _focusedDay, 
      firstDay: DateTime(2025, 1, 1), 
      lastDay: DateTime(2025, 5, 5),
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: _onDaySelected,
      eventLoader: _getEventsForDay,
    ),
    // ValueListenableBuilder(valueListenable: _selectedEvents, builder: (context, value, _) {
    //   return ListView.builder( itemBuilder: (context, index) {
    //     return Container(
    //       margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    //       child: ListTile(
    //         onTap: () => print(""), 
    //         title: Text('$value[index]}'))
    //     );
    //   });
    // }), Currently not working
    SizedBox(
      height: 20,
      width: 20,
      child: FittedBox(
        child: FloatingActionButton(onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                title: Text("Event Name"),
                content: Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(controller: _eventController)
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      events.addAll({
                        _selectedDay!:[Event(_eventController.text)]
                      });
                      Navigator.of(context).pop();
                      _selectedEvents.value = _getEventsForDay(_selectedDay!);
                    }, 
                    child: Text("Submit"))
                ],
              );
            });
        },
        child: Icon(Icons.add)) 
      )
    )]
    );
  }
}