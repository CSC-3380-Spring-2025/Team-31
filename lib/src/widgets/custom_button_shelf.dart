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
  const _GridContainer();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,      // Column Count
      mainAxisSpacing: 12.0,  // Row Spacing
      crossAxisSpacing: 12.0, // Column Spacing
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _GridButton(
          label: 'Create Set',
          onTap: (){
            Navigator.pushNamed(context, '/create_set');
          },
        ),
        _GridButton(
          label: 'Camera Input',
          onTap: (){
            Navigator.pushNamed(context, '/camera_input');
          },
        ),
        _GridButton(
          label: 'Voice Input',
          onTap: (){
            Navigator.pushNamed(context, '/voice_input');
          },
        ),
      ],
    );
  }
}

// Custom Button for Grid
class _GridButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _GridButton({
    required this.label,
    required this.onTap,
  });

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
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
      ),
      ),
    );
  }
}
