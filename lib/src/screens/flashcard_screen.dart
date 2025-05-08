//
// flashcard_screen.dart
//
//hard coded screen to demonstrate what scrolling through cards will be like.

import '../assets/essential.dart';
import '../widgets/back_button.dart';
import '../widgets/view_set_cards_preview.dart';
import '../widgets/button_grid.dart';
import '../widgets/card_list.dart';
import '../widgets/tts.dart';

class FlashcardScreen extends StatelessWidget {
  final List<Map<String, String>> cards = [
    {
      'front': 'What is the main organ of the human circulatory system?',
      'back': 'The heart is the main organ, pumping blood throughout the body.',
    },
    {
      'front': 'What are the two main types of blood vessels?',
      'back':
          'Arteries carry blood away from the heart, and veins carry blood back to the heart.',
    },
    {
      'front': 'What is the role of capillaries in the circulatory system?',
      'back':
          'Capillaries connect arteries and veins, allowing the exchange of oxygen, nutrients, and waste.',
    },
    {
      'front': 'What are the four chambers of the heart?',
      'back':
          'The heart has two atria (left and right) and two ventricles (left and right).',
    },
    {
      'front':
          'What is the difference between pulmonary and systemic circulation?',
      'back':
          'Pulmonary circulation moves blood between the heart and lungs; systemic circulation moves blood between the heart and the rest of the body.',
    },
    {
      'front': 'What type of blood cell carries oxygen?',
      'back':
          'Red blood cells contain hemoglobin, which binds and transports oxygen.',
    },
    {
      'front': 'What is the function of platelets in the circulatory system?',
      'back':
          'Platelets help form blood clots to stop bleeding at injury sites.',
    },
    {
      'front': 'What is blood plasma?',
      'back':
          'Plasma is the liquid component of blood, carrying nutrients, hormones, and waste products.',
    },
    {
      'front': 'What is the largest artery in the human body?',
      'back':
          'The aorta is the largest artery, distributing oxygenated blood from the heart.',
    },
    {
      'front': 'What is the function of the pulmonary artery?',
      'back':
          'The pulmonary artery carries deoxygenated blood from the heart to the lungs.',
    },
    {
      'front': 'What valve separates the left atrium from the left ventricle?',
      'back':
          'The mitral valve separates the left atrium from the left ventricle.',
    },
    {
      'front': 'What is the role of the vena cava in the circulatory system?',
      'back':
          'The vena cava (superior and inferior) returns deoxygenated blood from the body to the right atrium.',
    },
    {
      'front': 'What is hemoglobin?',
      'back':
          'Hemoglobin is a protein in red blood cells that binds oxygen for transport.',
    },
    {
      'front': 'What is the purpose of the coronary arteries?',
      'back': 'Coronary arteries supply blood to the heart muscle itself.',
    },
    {
      'front': 'What is the average resting heart rate for an adult?',
      'back':
          'The average resting heart rate for an adult is 60-100 beats per minute.',
    },
    {
      'front':
          'What is the function of white blood cells in the circulatory system?',
      'back':
          'White blood cells fight infections and support the immune system.',
    },
    {
      'front': 'What is the role of the aortic valve?',
      'back':
          'The aortic valve prevents backflow of blood from the aorta to the left ventricle.',
    },
    {
      'front': 'What is blood pressure?',
      'back':
          'Blood pressure is the force of blood against artery walls, measured as systolic over diastolic.',
    },
    {
      'front': 'What is the pacemaker of the heart?',
      'back':
          'The sinoatrial (SA) node is the heart’s pacemaker, initiating electrical impulses to control heartbeat.',
    },
    {
      'front': 'What is the function of the pulmonary veins?',
      'back':
          'Pulmonary veins carry oxygenated blood from the lungs to the left atrium.',
    },
  ];

  FlashcardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPageStack(
          children: [
            ReturnButton(),
            SizedBox(height: 600, child: ViewSetPreviewScroll(cards: cards)),
          ],
        ),
      ),
    );
  }
}

//cards[0]['front'].toString() access card text