//
// camera_screen.dart
//

import '../widgets/card.dart';
import '../assets/essential.dart';

class CameraScreen extends StatelessWidget{
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Input')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(label: Text("Camera")),
                Chip(label: Text("√ Voice")),
              ],
            ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const[
              CardPreview(title: 'Preview front of card'),
              CardPreview(title: 'Preview back of card'),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing:8,
            runSpacing:8,
            children: List.generate(
              4,
              (index)=> const CardFormatPreset(),
            ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                RecentMadeButton(),
                CircleAvatar(radius: 30, backgroundColor: Colors.grey),
                CourseButton(),
              ],
            ),
          ],
          ),
      ),
        );
     }
}