// 
// welcome_screen.dart
// 
// This is the landing page for all users
// when starting the app.
// 

import 'package:flutter/material.dart';

class CreateSetScreen extends StatelessWidget {
  	const CreateSetScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center( 
				child: CreateSetCard(),
			)
		);
	}
}

class CreateSetCard extends StatelessWidget {
	const CreateSetCard({super.key});

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
					Text("Create Set Page"),
				],
			)
		);
	}
}