//
// home_screen.dart
// 
// Home Screen
//

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home Screen'),
			),
			body: Center(
				child: Text('Hello World!'),
			),
		);
	}
}