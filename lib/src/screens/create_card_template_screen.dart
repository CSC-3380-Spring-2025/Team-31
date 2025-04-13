import '../widgets/essential.dart';

// Primary Screen Layout
class CreateCardTemplateScreen extends StatelessWidget {
  const CreateCardTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Flashcard")),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: const Text('Front'),
                subtitle: const TextField(
                  decoration: InputDecoration.collapsed(hintText: 'Cliock to edit front'),
                  maxLines: null,
                ),
              ),
                ),
                Card(
                 child: ListTile(
                title: const Text('Back'),
                subtitle: const TextField(
                  decoration: InputDecoration.collapsed(hintText: 'Cliock to edit back'),
                  maxLines: null,
                ),
              ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
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
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        ],
      ),
    );
  }
}
                      