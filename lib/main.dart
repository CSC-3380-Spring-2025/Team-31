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
				'/': (BuildContext context) => MainScreen(screenIndex: 0),
				'/home': (BuildContext context) => MainScreen(screenIndex: 1),
				'/create_set': (BuildContext context) => MainScreen(screenIndex: 2),
				'/other': (BuildContext context) => MainScreen(screenIndex: 3),
			},
			theme: ThemeData(
				brightness: Brightness.dark,
				primaryColor: Colors.blueGrey,
			)
		);
	}
}

class MainScreen extends StatefulWidget {
	final int screenIndex;

	const MainScreen({super.key, required this.screenIndex});

	@override
	State<MainScreen> createState() => _MainStateScreen();
}

class _MainStateScreen extends State<MainScreen> {
	late int _selectedIndex = 0;

	static const List<Widget> _screens = [
		WelcomeScreen(),
		HomeScreen(),
		CreateSetScreen(),
		OtherScreen(),
	];

	@override
	void initState() {
		super.initState();
		_selectedIndex = widget.screenIndex;
	}

	void _onItemTapped(int index) {
		setState(() {
			_selectedIndex = index;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: _screens[_selectedIndex],
			bottomNavigationBar: BottomNavigationBar(
				items: const [
					BottomNavigationBarItem(
						icon: Icon(Icons.waving_hand_rounded),
						label: "Welcome"
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.home),
						label: "Home"
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.add),
						label: "Create Set"
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.circle),
						label: "Other"
					),
				],
				currentIndex: _selectedIndex,
				onTap: _onItemTapped,
				selectedItemColor: Theme.of(context).primaryColor, // Adaptive color
				unselectedItemColor: Colors.grey,
			),
		);
	}
}