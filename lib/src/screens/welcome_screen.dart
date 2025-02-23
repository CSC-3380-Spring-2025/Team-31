// 
// welcome_screen.dart
// 
// This is the landing page for all users
// when starting the app.
// 

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  	const WelcomeScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center( 
				child: WelcomeCard(),
			)
		);
	}
}

class WelcomeCard extends StatelessWidget {
	const WelcomeCard({super.key});

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: const EdgeInsets.all(16.0),
			decoration: BoxDecoration(
				color: Colors.black,
			),
			child: Column(
				mainAxisSize: MainAxisSize.min,
				children: [
					Text("Welcome to Flashcard App"),
					CustomNavigatorButton(
						text: "Home Page",
						openRoute: '/home',
					),
					CustomNavigatorButton(
						text: "Create Set Page",
						openRoute: '/create_set',
					),
					CustomNavigatorButton(
						text: "Other Page",
						openRoute: '/other',
					),
				],
			)
		);
	}
}

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