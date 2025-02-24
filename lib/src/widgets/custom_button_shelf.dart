// 
// custom_button_shelf.dart
// 
// This is a custom button shelf.
//

import './essential.dart';

// Widget: Container for Label & Button Grid
class CustomButtonShelf extends StatelessWidget {
  final String label;

  const CustomButtonShelf({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: CustomStack(
        children: [
          _SectionLabel(label: label),
          _GridContainer(),
        ],
      ),
    );
  } 
}

// Label for Button Shelf
class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 0, 0, 6.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}

// Grid Container for Buttons
class _GridContainer extends StatelessWidget {
  const _GridContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,      // Column Count
      mainAxisSpacing: 12.0,  // Row Spacing
      crossAxisSpacing: 12.0, // Column Spacing
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _GridButton(),
        _GridButton(),
        _GridButton(),
      ],
    );
  }
}

// Custom Button for Grid
class _GridButton extends StatelessWidget {
  const _GridButton({super.key});

  void handleButtonClick() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handleButtonClick,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0)
        ),
        padding: EdgeInsets.all(12.0),
        child: Text("Placeholder"),
      )
    );
  }
}