//
// create_card_template_screen.dart
//
// Create Card Template Screen
//

import '../assets/essential.dart';

// Primary Screen Layout
class CreateCardTemplateScreen extends StatelessWidget {
  const CreateCardTemplateScreen(
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Flashcard"),
        centerTitle: true, //(small: makes AppBar title centered)
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: const Text('Front'),
                subtitle: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                  decoration: InputDecoration.collapsed(hintText: 'Click to edit front'),
                  maxLines: null,
                ),
              ),
                ),
            ),
            const SizedBox(height: 16),
                Card(
                 child: ListTile(
                title: const Text('Back'),
                subtitle: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                  decoration: InputDecoration.collapsed(hintText: 'Click to edit back'),
                  maxLines: null,
                ),
              ),
                ),
            ),
                const SizedBox(height: 24),
                const Text(
                  'Add Elements',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: (){},
                      icon: const Icon(Icons.image),
                      label: const Text("Add Image"),
                      ),
                      ElevatedButton.icon(
                      onPressed: (){},
                      icon: const Icon(Icons.video_library),
                      label: const Text("Add Video"),
                      ),
                      ElevatedButton.icon(
                      onPressed: (){},
                      icon: const Icon(Icons.text_fields),
                      label: const Text("New Text Line"),
                      ),
                      ElevatedButton(
                      onPressed: (){},
                      child: const Text("Bullet Points"),
                      ),
                       ElevatedButton(
                      onPressed: (){},
                      child: const Text("Numbers"),
                      ),
                  ],
                ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
             label: 'Home',
          ),
        ],
      ),
    );
  }
}
                      