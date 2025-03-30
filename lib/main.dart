// 
// main.dart
// 
// This is the main entry point
// for the application.
// 

import 'package:flutter/material.dart';
import 'src/assets/essential.dart';
import 'src/assets/screens.dart';

void main() {
	runApp(const MyApp());
}

// Main App Object
//
// Material Config
// Routing + Theme
class MyApp extends StatelessWidget {
	const MyApp({super.key});
	
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: "Study Hall",
			initialRoute: '/',
			routes: <String, WidgetBuilder>{
				'/': (BuildContext context) => MainScreen(screenCode: "home"),
				'/home': (BuildContext context) => MainScreen(screenCode: "home"),
				'/create_set': (BuildContext context) => MainScreen(screenCode: "create_set"),
				'/settings': (BuildContext context) => MainScreen(screenCode: "settings"),
        '/card_screen': (BuildContext context) => MainScreen(screenCode: "card_screen",),
        '/dev': (BuildContext context) => MainScreen(screenCode: "dev",),
			},
			theme: ThemeData(
				brightness: Brightness.dark,
				primaryColor: Colors.blueGrey,
			)
		);
	}
}

// Stateful widget for the app's main navigation container
class MainScreen extends StatefulWidget {
	final String screenCode;

	const MainScreen({
    super.key, 
    required this.screenCode
  });

	@override
	State<MainScreen> createState() => _MainStateScreen();
}

// State manager for MainScreen, handling screen selection
class _MainStateScreen extends State<MainScreen> {
  // Active Page Index
	late String _selectedIndex = "";

  // Map of Screen Views
	static const Map<String, Widget> _screens = {
		"home": HomeScreen(),
    "create_set": CreateSetScreen(),
    "settings": SettingsScreen(),
    "card_screen": HomeScreen(),
    "dev": DevTestScreen()
	};

  // Fetches screenIndex from MainScreen
	@override
	void initState() {
		super.initState();
		_selectedIndex = widget.screenCode;
	}

  // Updates _selectedIndex onTap
	void _onItemTapped(String screenCode) {
		setState(() {
			_selectedIndex = screenCode;
		});
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex] ?? const Center(child: Text("Screen not found")),
      appBar: AppBar(title: const Text('Study Hall')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 128,
              child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Navigation')
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                _onItemTapped("home");
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Create Set'),
              onTap: () {
                _onItemTapped("create_set");
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                _onItemTapped("settings");
              },
            ),
            ListTile(
              leading: const Icon(Icons.security_rounded),
              title: const Text('Development'),
              onTap: () {
                _onItemTapped("dev");
              },
            )
          ],
        )
      ),
    );
    
  }
}