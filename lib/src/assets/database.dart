//
// database.dart
//
// Database access functions
//

import 'package:cloud_firestore/cloud_firestore.dart';
export 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // Get User Data Object
  Future<DocumentSnapshot> getUserData(String username) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .limit(1)
          .get();
      
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first;
      } else {
        throw Exception('User with username "$username" not found');
      }
    } on FirebaseException catch (e) {
      // Specifically catch FirebaseException
      throw Exception('Firestore error: ${e.message} (Code: ${e.code})');
    } catch (e) {
      // Catch any other errors
      throw Exception('Error fetching user data: $e');
    }
  }

  Future<void> storeUserData(String username, String email, String password) async {
    try {
      await _firestore.collection('users').add({
        'username': username,
        'email': email,
        'password': password,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Error storing user data: $e');
    }
  }
}

// Singleton instance
final DatabaseService dbService = DatabaseService();
