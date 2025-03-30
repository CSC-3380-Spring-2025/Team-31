//
// database.dart
//
// Database access functions
//


import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  // Existing functions remain here...
  
  // New function to get user data by username
  Future<DocumentSnapshot> getUserData(String username) async {
    try {
      // Query the users collection where the username field matches the provided username
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .limit(1) // We only want one result since usernames should be unique
          .get();
      
      // Check if we got any results
      if (querySnapshot.docs.isNotEmpty) {
        // Return the first (and should be only) document
        return querySnapshot.docs.first;
      } else {
        // Throw an exception if no user is found
        throw Exception('User with username "$username" not found');
      }
    } catch (e) {
      // Re-throw the exception with more context
      throw Exception('Error fetching user data: $e');
    }
  }

  // Rest of the existing functions...
}

// Singleton instance
final DatabaseService dbService = DatabaseService();
