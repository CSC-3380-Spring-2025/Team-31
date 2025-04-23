//
// auth_gate.dart
// 
// Authentication Gate
// 

import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/Firebase_ui_oauth_google.dart';

import '../../main.dart';
import '../assets/essential.dart';
import '../assets/database.dart';
import './route_handler.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Loading Indicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        // IF Logged In
        if (snapshot.hasData) {
          // Get User Object & Create Document
          final user = snapshot.data!;
          dbService.createUserDocument(user).catchError((e) {
            print('Error creating user document: $e');
          });
          // Send to Home Screen
          return MainScreen(screenWidget: RouteHandler(route: "/home").getScreen());
        }
        // IF Logged Out
        else {
          return SignInScreen(
            //avenues for authentication set up through firebase for out program
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: '34811750205-4rmsh2v96o4qisaakn6mi1c531f6qn3m.apps.googleusercontent.com'),
            ],
            headerBuilder: (context, constraints, shrinkOffset){
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('lib/src/assets/study_hall_icon.png')
                )
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top:16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.', //would love to add some sarcasm here
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            sideBuilder:(context, shrinkOffSet){
              return Padding(
                padding:const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('lib/src/assets/study_hall_icon.png')
                )
              );
            },
          );
        }
      },
    );
  }
}