import 'package:flutter/material.dart';

void main() {
  	runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  	const MainApp({super.key});

  	@override
  	Widget build(BuildContext context) {
		return const MaterialApp(
		home: Scaffold(
			body: Padding(
				padding: EdgeInsets.all(16.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Text(
							'Hello World!',
							style: TextStyle(
								fontSize: 18,
								fontWeight: FontWeight.bold,
							),
						),
						Text('This is our brand new flashcard app!'),
					],
				),
			),
		),
	);
  }
}
