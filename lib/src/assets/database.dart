//
// database.dart
//
// Firestore database service for user data operations.
// Provides methods to fetch and update user data, designed to be imported by other screens.
//

import 'package:cloud_firestore/cloud_firestore.dart';

/// DatabaseService class to handle Firestore operations for user data.
class DatabaseService {
  final FirebaseFirestore _firestore;
  static const String _usersCollection = 'users';

  DatabaseService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Fetches a user's data by their Firebase Auth user ID (UID).
  /// Returns a Map of user data if found, or throws an exception if not.
  /// Example usage in a screen:
  /// ```dart
  /// final userData = await dbService.getUserById('user_uid');
  /// print(userData['username']);
  /// ```
  Future<Map<String, dynamic>> getUserById(String uid) async {
    try {
      final docSnapshot =
          await _firestore.collection(_usersCollection).doc(uid).get();

      if (docSnapshot.exists && docSnapshot.data() != null) {
        return docSnapshot.data()!;
      } else {
        throw Exception('User with UID "$uid" not found');
      }
    } on FirebaseException catch (e) {
      throw Exception('Firestore error: ${e.message} (Code: ${e.code})');
    } catch (e) {
      throw Exception('Error fetching user data: $e');
    }
  }

  /// Updates a user's data in Firestore by their Firebase Auth user ID (UID).
  /// Takes a Map of fields to update (e.g., {'username': 'new_name', 'email': 'new@email.com'}).
  /// Creates a new document if the user doesn't exist.
  /// Example usage in a screen:
  /// ```dart
  /// await dbService.updateUserData('user_uid', {'username': 'new_username'});
  /// ```
  Future<void> updateUserData(String uid, Map<String, dynamic> data) async {
    try {
      // Remove sensitive fields if accidentally included
      data.remove('password');

      await _firestore.collection(_usersCollection).doc(uid).set(
        {
          ...data,
          'updatedAt': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true), // Merge to avoid overwriting unrelated fields
      );
    } on FirebaseException catch (e) {
      throw Exception('Firestore error: ${e.message} (Code: ${e.code})');
    } catch (e) {
      throw Exception('Error updating user data: $e');
    }
  }
}

/// Singleton instance of DatabaseService for easy access across the app.
/// Import and use: `dbService.getUserById(uid)`
/// For testing, you can inject a mock Firestore instance: `DatabaseService(firestore: mockFirestore)`
final DatabaseService dbService = DatabaseService();