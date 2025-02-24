//
// page_stacks.dart
//
// This is where custom defined page structures
// and content stacks will reside.
//

import 'package:flutter/material.dart';

//
// CustomPageStack
//
// Takes in an array of children that are then
// vertically stacked on top of each other,
// returning a single scroll view vertical
// content stack taking full device width
// and aligning left.
//
// Use for creating main page content stacks.
// 
class CustomPageStack extends StatelessWidget {
  final List<Widget> children;
  
  const CustomPageStack({
    super.key,
    required this.children,
  });

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: SafeArea( 
				child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
			)
		);
	}
}

//
// CustomStack
//
// Takes in an array of children that are then
// vertically stacked on top of each other,
// similar to CustomPageStack, but intended for
// widget content stacks, not page content
// stacks.
//
// Use when column stacking content.
// 
class CustomStack extends StatelessWidget {
  final List<Widget> children;

  const CustomStack({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}

