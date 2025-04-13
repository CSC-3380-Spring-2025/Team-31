//
// auth_gate.dart
//
// Authentication Gate Widget
//

import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import 'package:firebase_ui_oauth_google/Firebase_ui_oauth_google.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    //stream is passed a firebaseAuth.authStateChange and will return a user if user has been authenticated, otherwise returns null
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //if the stream returns null i.e. not a user, redirects to the loginScreen
        if (!snapshot.hasData) {
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
                  //child: Image.asset(/*add our logo asset here once addeded to assets*/)
                )
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top:16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',//would love to add some sarcasm here
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            sideBuilder:(context, shrinkOffSet){
              return Padding(
                padding:const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('flutterfire_300x.png'),
                  ),
              );
            },
          );
        }
        //otherwise a user is returned and directs to the home screen
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/login_screen');
        });
        // Return a temporary widget while navigation occurs
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}