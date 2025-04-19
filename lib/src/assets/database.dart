//
// database.dart
//
// Firestore database service for user data operations.
// Provides methods to fetch and update user data, designed to be imported by other screens.
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// DatabaseService class to handle Firestore operations for user data.
class DatabaseService {
  final FirebaseFirestore _firestore;
  static const String _usersCollection = 'users';
  static const String _cardsCollection = 'cards';
  static const String _coursesCollection = 'courses';

  DatabaseService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Creates a new user document in Firestore with the user's UID as the document ID.
  /// If the document already exists, updates the last login timestamp.
  /// Example usage:
  /// ```dart
  /// await dbService.createUserDocument(user);
  /// ```
  Future<void> createUserDocument(User user) async {
    try {
      final userDocRef = _firestore.collection(_usersCollection).doc(user.uid);
      final docSnapshot = await userDocRef.get();

      if (!docSnapshot.exists) {
        // Create new document with basic user info
        await userDocRef.set({
          'uid': user.uid,
          'email': user.email ?? '',
          'displayName': user.displayName ?? '',
          'photoURL': user.photoURL ?? '',
          'createdAt': FieldValue.serverTimestamp(),
          'lastLogin': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'courses': [],
        });
      } else {
        // Update last login timestamp
        await userDocRef.update({
          'lastLogin': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        });
      }
    } on FirebaseException catch (e) {
      throw Exception('Firestore error: ${e.message} (Code: ${e.code})');
    } catch (e) {
      throw Exception('Error creating/updating user document: $e');
    }
  }

  /// Creates a new card document in the cards collection and adds its reference to the specified course.
  Future<String> createCard(String courseId, Map<String, dynamic> cardData) async {
    try {
      final cardDocRef = _firestore.collection(_cardsCollection).doc();
      await cardDocRef.set({
        ...cardData,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      final courseDocRef = _firestore.collection(_coursesCollection).doc(courseId);
      await courseDocRef.update({
        'cards': FieldValue.arrayUnion([cardDocRef]),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return cardDocRef.id;
    } on FirebaseException catch (e) {
      throw Exception('Firestore error: ${e.message} (Code: ${e.code})');
    } catch (e) {
      throw Exception('Error creating card: $e');
    }
  }

  /// Creates a new course document and adds its reference to the user's courses array.
  Future<String> createCourse(String userId, Map<String, dynamic> courseData) async {
    try {
      final courseDocRef = _firestore.collection(_coursesCollection).doc();
      await courseDocRef.set({
        ...courseData,
        'cards': [],
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      final userDocRef = _firestore.collection(_usersCollection).doc(userId);
      await userDocRef.update({
        'courses': FieldValue.arrayUnion([courseDocRef]),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return courseDocRef.id;
    } on FirebaseException catch (e) {
      throw Exception('Firestore error: ${e.message} (Code: ${e.code})');
    } catch (e) {
      throw Exception('Error creating course: $e');
    }
  }

  /// Fetches the list of courses for a user by resolving the references in their courses array.
  Future<List<Map<String, dynamic>>> getUserCourses(String userId) async {
    try {
      final userDoc = await _firestore.collection(_usersCollection).doc(userId).get();
      if (!userDoc.exists || userDoc.data() == null) {
        throw Exception('User with UID "$userId" not found');
      }

      final courseRefs = userDoc.data()!['courses'] as List<dynamic>? ?? [];
      final courses = <Map<String, dynamic>>[];

      for (final ref in courseRefs) {
        final courseDoc = await ref.get();
        if (courseDoc.exists && courseDoc.data() != null) {
          courses.add({
            'id': courseDoc.id,
            ...courseDoc.data()!,
          });
        }
      }

      return courses;
    } on FirebaseException catch (e) {
      throw Exception('Firestore error: ${e.message} (Code: ${e.code})');
    } catch (e) {
      throw Exception('Error fetching user courses: $e');
    }
  }

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