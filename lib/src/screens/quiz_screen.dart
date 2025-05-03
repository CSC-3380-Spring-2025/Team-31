import '../assets/essential.dart';
import '../widgets/back_button.dart';
import 'dart:math';
import 'dart:async';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Map<String, String>> cards;
  int currentQuestionIndex = 0;
  int score = 0;
  List<String> answerOptions = [];
  String? selectedAnswer;
  Color? feedbackColor;
  bool isCorrectAnswered = false;
  int attemptCount = 0; // Track number of attempts per question
  Timer? _timer; // Timer for time-based scoring
  int _secondsElapsed = 0; // Time elapsed for current question

  @override
  void initState() {
    super.initState();
    // Initialize and shuffle cards
    cards = [
      {
        'front': 'What is the main organ of the human circulatory system?',
        'back':
            'The heart is the main organ, pumping blood throughout the body.',
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
        'front':
            'What valve separates the left atrium from the left ventricle?',
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
    ]..shuffle(Random());
    _startTimer();
    _generateAnswerOptions();
  }

  void _startTimer() {
    _secondsElapsed = 0;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  void _generateAnswerOptions() {
    final correctAnswer = cards[currentQuestionIndex]['back']!;
    final wrongAnswers = <String>[];
    final random = Random();

    // Collect all possible wrong answers (excluding the correct one)
    final allWrong =
        cards
            .asMap()
            .entries
            .where((entry) => entry.key != currentQuestionIndex)
            .map((entry) => entry.value['back']!)
            .toList();

    // Randomly select 3 wrong answers
    while (wrongAnswers.length < 3 && allWrong.isNotEmpty) {
      final index = random.nextInt(allWrong.length);
      wrongAnswers.add(allWrong.removeAt(index));
    }

    // Combine correct and wrong answers, then shuffle
    setState(() {
      answerOptions = [correctAnswer, ...wrongAnswers]..shuffle(random);
      selectedAnswer = null;
      feedbackColor = null;
      attemptCount = 0; // Reset attempts for new question
      _startTimer(); // Start timer for new question
    });
  }

  void _handleAnswer(String selected) {
    final correctAnswer = cards[currentQuestionIndex]['back']!;
    setState(() {
      selectedAnswer = selected;
      feedbackColor = selected == correctAnswer ? Colors.green : Colors.red;
      attemptCount++;

      if (selected == correctAnswer && !isCorrectAnswered) {
        // Calculate time-based score (max 100 points, reduced by time taken)
        int timePenalty = (_secondsElapsed / 2).floor(); // Small influence: 1 point per 2 seconds
        int baseScore = (100 - timePenalty).clamp(0, 100);

        // Apply attempt-based penalty
        int attemptPenalty = (attemptCount - 1) * 25; // 25 points per wrong attempt
        int finalScore = (baseScore - attemptPenalty).clamp(0, 100);

        score += finalScore;
        isCorrectAnswered = true;
        _timer?.cancel(); // Stop the timer on correct answer
      }
    });

    if (selected == correctAnswer) {
      // Delay to show feedback, then proceed
      Future.delayed(Duration(milliseconds: 500), () {
        if (currentQuestionIndex < cards.length - 1) {
          setState(() {
            currentQuestionIndex++;
            isCorrectAnswered = false;
            _generateAnswerOptions();
          });
        } else {
          // End of quiz
          _timer?.cancel();
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text('Quiz Completed'),
                  content: Text('Your final score is $score'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          cards.shuffle(Random());
                          currentQuestionIndex = 0;
                          score = 0;
                          isCorrectAnswered = false;
                          _generateAnswerOptions();
                        });
                      },
                      child: Text('Restart'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = cards[currentQuestionIndex]['front']!;

    return Scaffold(
      backgroundColor: AppTheme.getColor('primary', context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar and score
              QuizHeader(
                currentQuestion: currentQuestionIndex + 1,
                totalQuestions: cards.length,
                score: score,
              ),
              SizedBox(height: 40),
              // Question text
              Expanded(
                child: Center(
                  child: Text(
                    question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Answer options (fixed at bottom)
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      answerOptions
                          .map(
                            (option) => AnswerButton(
                              text: option,
                              onPressed:
                                  isCorrectAnswered
                                      ? null
                                      : () => _handleAnswer(option),
                              backgroundColor:
                                  selectedAnswer == option
                                      ? feedbackColor
                                      : null,
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizHeader extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;
  final int score;

  const QuizHeader({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question $currentQuestion of $totalQuestions',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            ProgressBar(
              currentQuestion: currentQuestion,
              totalQuestions: totalQuestions,
            ),
          ],
        ),
        Text(
          '$score',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  const AnswerButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ?? AppTheme.getColor('background', context),
          foregroundColor: AppTheme.getColor('text', context),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.2),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const ProgressBar({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: LinearProgressIndicator(
        value: currentQuestion / totalQuestions,
        backgroundColor: Colors.grey[800],
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        minHeight: 8,
      ),
    );
  }
}