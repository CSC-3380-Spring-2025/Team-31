// 
// welcome_screen.dart
// 
// This is the landing page for all users
// when starting the app.
// 

import 'package:flutter/material.dart';

class CustomNavigatorButton extends StatelessWidget {
	final String text;
	final String openRoute;

	const CustomNavigatorButton({
		super.key,
		required this.text,
		required this.openRoute,
	});

	@override
	Widget build(BuildContext context) {
		return TextButton(
			onPressed: () {
				Navigator.pushNamed(context, openRoute);
			},
			child: Text(text),
		);
	}
}