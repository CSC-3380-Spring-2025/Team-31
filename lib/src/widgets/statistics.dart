import 'package:study_hall/main.dart';


import '../assets/essential.dart';
import 'package:graphic/graphic.dart';

class Statistics extends StatefulWidget{

  
  const Statistics({super.key});

  @override
  State<Statistics> createState() => StatsState();
}

class StatsState extends State<Statistics>
{

  late String setName;

  void initState()
  {
    super.initState();
    setState(() {
      setName = "test";
    });
  }
  void statTitle(String current)
  {
    setState(() {
      setName = current;
    });
  }
  @override
  Widget build(BuildContext context)
  {
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.all(Radius.circular(20)),
    //     color: Colors.blueGrey),
    //   height: 150,
    //   width: double.infinity,
    //   alignment: Alignment.center,
    //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    //   child: Column(
    //     children: [Text(setName + " Statistics"),],
    //   ),
    // );

    return SizedBox(
      height: 150,
    child: Chart(data: 
    [{'day' : '4/19/25', 'studied' : 12},
     {'day' : '4/20/25', 'studied' : 15},
     {'day' : '4/21/25', 'studied' : 10},
     {'day' : '4/22/25', 'studied' : 18},],
     variables: {'day' : Variable(
      accessor: (Map map) => map['day'] as String,
     ),
     'studied' : Variable(
      accessor: (Map map) => map['studied'] as num,
     )
     },
     marks: [IntervalMark()],
     axes : [
      Defaults.horizontalAxis,
      Defaults.verticalAxis
     ]
     )
     );
  }
}