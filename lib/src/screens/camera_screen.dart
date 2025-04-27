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
      appBar: AppBar(
        title: const Text('Camera Input'),
        centerTitle: true, //(small improvement: center title)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // (small improvement:  more natural alignment)
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(label: Text("Camera")),
                Chip(label: Text("Voice Input")), //(small improvement: clearer label)
              ],
            ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const[
              CardPreview(title: 'Front Preview'),
              CardPreview(title: 'Back Preview'),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Format Presets',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing:8,
            runSpacing:8,
            children: List.generate(
              4,
              (index)=> const CardFormatPreset(),
            ),
            ),
            const SizedBox(height: 32),
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