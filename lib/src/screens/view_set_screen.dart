// 
// view_set_screen.dart
// 
// This is the empty screen file template.
//

import '../assets/essential.dart';
import '../widgets/back_button.dart';
import '../widgets/section_label.dart';
import '../widgets/view_set_cards_preview.dart';
import '../widgets/button_grid.dart';
import '../widgets/card_list.dart';

class ViewSetScreen extends StatelessWidget {
  ViewSetScreen({super.key});

  final List<Map<String, String>> cards = [
    {
      'front': 'What is the main organ of the human circulatory system?',
      'back': 'The heart is the main organ, pumping blood throughout the body.'
    },
    {
      'front': 'What are the two main types of blood vessels?',
      'back': 'Arteries carry blood away from the heart, and veins carry blood back to the heart.'
    },
    {
      'front': 'What is the role of capillaries in the circulatory system?',
      'back': 'Capillaries connect arteries and veins, allowing the exchange of oxygen, nutrients, and waste.'
    },
    {
      'front': 'What are the four chambers of the heart?',
      'back': 'The heart has two atria (left and right) and two ventricles (left and right).'
    },
    {
      'front': 'What is the difference between pulmonary and systemic circulation?',
      'back': 'Pulmonary circulation moves blood between the heart and lungs; systemic circulation moves blood between the heart and the rest of the body.'
    },
    {
      'front': 'What type of blood cell carries oxygen?',
      'back': 'Red blood cells contain hemoglobin, which binds and transports oxygen.'
    },
    {
      'front': 'What is the function of platelets in the circulatory system?',
      'back': 'Platelets help form blood clots to stop bleeding at injury sites.'
    },
    {
      'front': 'What is blood plasma?',
      'back': 'Plasma is the liquid component of blood, carrying nutrients, hormones, and waste products.'
    },
    {
      'front': 'What is the largest artery in the human body?',
      'back': 'The aorta is the largest artery, distributing oxygenated blood from the heart.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPageStack(
          children: [
            // Button: Back to Home
            ReturnButton(),
            // Set Preview Scroll
            SectionLabel(text: "Circulatory System"),
            SizedBox(
              height: 300,
              child: ViewSetPreviewScroll(cards: cards),
            ),
            // Quick Action Button Grid
            SectionLabel(text: "Quick Actions"),
            ButtonGrid(
              buttons: [
                {
                  'icon': Icons.book, 
                  'label': 'Flashcards',
                  'route': '/flashcards'
                },
                {
                  'icon': Icons.quiz, 
                  'label': 'Quiz Yourself',
                  'route': '/quiz'
                },
                {
                  'icon': Icons.add, 
                  'label': 'Create Card',
                  'route': '/camera'
                },
                {
                  'icon': Icons.edit, 
                  'label': 'Edit Set',
                  'route': '/edit_set'
                },
                {
                  'icon': Icons.people, 
                  'label': 'Group Study',
                  'route': '/group_study'
                },
                {
                  'icon': Icons.share, 
                  'label': 'Share Set',
                  'route': '/share_set'
                },
              ]
            ),
            // All Card List
            SectionLabel(text: "All Cards"),
            CardList(cards: cards)
          ],
        ),
      ),
    );
  }
}