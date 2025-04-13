// 
// create_set_screen.dart
// 
// This is the page where users
// will create new sets.
// 

 create-screens
import '../widgets/essential.dart';

import '../assets/essential.dart';
import '../widgets/custom_page_header.dart';
 main

// Primary Screen Layout
class CreateSetScreen extends StatelessWidget {
  const CreateSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Course")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Course Name',
                border: OutlineInputBorder(),
              ),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                labelText: 'Secondary Label (e.g., class number)',
                border: OutlineInputBorder(),
              ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                items: ['High School', 'College', 'Graduate']
                .map((level)=> DropdownMenuItem(
                  value: level,
                  child: Text(level),
                  ))
                  .toList(),
                  onChanged: (value){},
                  decoration: InputDecoration(
                    labelText: 'Eduaction Level',
                    border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () async{
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                         firstDate: DateTime(2020), 
                         lastDate: DateTime(2030),
                         );
                    },
                    child: const Text("Pick Date"),
                  ),
          ],
  ),
  ),
  bottomNavigationBar: BottomNavigationBar(
    items:const [
      BottomNavigationBarItem(icon: Icon(Icons.description),label:''),
       BottomNavigationBarItem(icon: Icon(Icons.group),label:''),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today),label:''),
         BottomNavigationBarItem(icon: Icon(Icons.home),label:''),
    ],
    ),
    );
}
}