// 
// welcome_screen.dart
// 
// This is the landing page for all users
// when starting the app.
// 

import 'package:flutter/material.dart';

import 'src/screens/home_screen.dart';
import 'src/screens/welcome_screen.dart';
import 'src/screens/create_set_screen.dart';
import 'src/screens/other_screen.dart';

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});
	
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: "Flashcard App",
			initialRoute: '/',
			routes: <String, WidgetBuilder>{
				'/': (BuildContext context) => WelcomeScreen(),
				'/home': (BuildContext context) => HomeScreen(),
				'/create_set': (BuildContext context) => CreateSetScreen(),
				'/other': (BuildContext context) => OtherScreen(),
			},
			theme: ThemeData(
				brightness: Brightness.dark,
				primaryColor: Colors.blueGrey,
			)
		);
	}
}