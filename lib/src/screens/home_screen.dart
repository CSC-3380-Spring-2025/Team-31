// 
// home_screen.dart
// 
// This is the landing page for all users
// when starting the app.
// 

import 'package:flutter/material.dart';

// Main Page Structure
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: SafeArea( 
				child: SingleChildScrollView(
          child: HomeScreenStack(),
        ),
			)
		);
	}
}

// Page Content Stack
class HomeScreenStack extends StatelessWidget {
  const HomeScreenStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomePageHeader(),
        ButtonGridSection(label: "Popular Sets"),
        ButtonGridSection(label: "Recommended Sets"),
      ]
    );
  }
}

// Section: Page Header
class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24.0, 48.0, 24.0, 0.0),
      child: const Text(
        "Flashcard App",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Section: Button Grid (Label + Grid)
class ButtonGridSection extends StatelessWidget {
  final String label;

  const ButtonGridSection({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 0, 0, 6.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          ButtonGrid(),
        ],
      ),
    );
  } 
}

// Widget: Button Grid
class ButtonGrid extends StatelessWidget {
  const ButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Original (First) Grid Building Method
    //
    return GridView.count(
      crossAxisCount: 3,      // Column Count
      mainAxisSpacing: 12.0,  // Row Spacing
      crossAxisSpacing: 12.0, // Column Spacing
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ButtonGridButton(),
        ButtonGridButton(),
        ButtonGridButton(),
      ],
    );

    // Refined Grid Building Method
    // return Wrap(
    //   spacing: 12.0,    // Row Spacing
    //   runSpacing: 12.0, // Column Spacing
    //   alignment: WrapAlignment.spaceBetween,
    //   children: const [
    //     ButtonGridButton(),
    //     ButtonGridButton(),
    //     ButtonGridButton(),
    //   ],
    // );
  }
}

// Widget: Custom Button for ButtonGrid
class ButtonGridButton extends StatelessWidget {
  const ButtonGridButton({super.key});

  void handleButtonClick() {
    print("Button had been clicked");
  }

  @override
  Widget build(BuildContext context) {
    // InkWell is a custom-defined touch target
    return InkWell(
      onTap: () => handleButtonClick,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0)
        ),
        padding: EdgeInsets.all(12.0),
        child: Text("Content"),
      )
    );
  }
}