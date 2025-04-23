//
// card_list.dart
//

import '../assets/essential.dart';

class CardList extends StatelessWidget {
  final List<Map<String, String>> cards;

  const CardList({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: cards.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final card = cards[index];
        return IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      card['front'] ?? '',
                      style: TextStyle(
                        color: AppTheme.getColor('text', context),
                        fontSize: 14,
                      ),
                      softWrap: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      card['back'] ?? '',
                      style: TextStyle(
                        color: AppTheme.getColor('text', context),
                        fontSize: 14,
                      ),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}