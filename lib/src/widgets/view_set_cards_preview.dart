//
// view_setwidget.cards.length_preview.dart
//
// This widget is the horizontal
// scroll preview of cards of a
// set.
//
// Buggy! Not Functional!
//

import '../assets/essential.dart';

class ViewSetPreviewScroll extends StatefulWidget {
  final List<Map<String, String>> cards;

  const ViewSetPreviewScroll({
    super.key,
    required this.cards
  });

  @override
  CardPreviewScrollState createState() => CardPreviewScrollState();
}

class CardPreviewScrollState extends State<ViewSetPreviewScroll> {
  late PageController _pageController;
  List<bool> _isFront = [];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _isFront = List.generate(widget.cards.length, (_) => true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPreviousCard() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNextCard() {
    if (_currentPage < widget.cards.length - 1) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _flipCard(int index) {
    setState(() {
      _isFront[index] = !_isFront[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.cards.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final card = widget.cards[index];
              return CardWidget(
                frontText: card['front']!,
                backText: card['back']!,
                isFront: _isFront[index],
                onTap: () => _flipCard(index),
              );
            },
          ),
          NavigationArrows(
            onPrevious: _goToPreviousCard,
            onNext: _goToNextCard,
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String frontText;
  final String backText;
  final bool isFront;
  final VoidCallback onTap;

  const CardWidget({
    super.key,
    required this.frontText,
    required this.backText,
    required this.isFront,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 0, 0, 0),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: const Color.fromARGB(50, 255, 255, 255),
            width: 2.0,
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Center(
            key: ValueKey<bool>(isFront),
            child: Text(
              isFront ? frontText : backText,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationArrows extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationArrows({
    super.key,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_left),
              onPressed: onPrevious,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.arrow_right),
              onPressed: onNext,
            ),
          ),
        ),
      ],
    );
  }
}