//
// database.dart
//
// Firestore database service for user data operations.
// Provides methods to fetch and update user data, designed to be imported by other screens.
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// DatabaseService class to handle Firestore operations for user data.
class DatabaseService {
  final FirebaseFirestore _firestore;
  static const String _usersCollection = 'users';
  static const String _cardsCollection = 'cards';
  static const String _coursesCollection = 'courses';

  DatabaseService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  // Creates user document
  Future<void> createUserDocument(User user) async {
    try {
      final userDocRef = _firestore.collection(_usersCollection).doc(user.uid);
      final docSnapshot = await userDocRef.get();
      final courseRef1 = _firestore.collection(_coursesCollection).doc('g1RBpIUrDYdpN0hcxy9k');
      final courseRef2 = _firestore.collection(_coursesCollection).doc('0tcaeLn4WdfPvMwx7VXU');

      if (!docSnapshot.exists) {
        await userDocRef.set({
          'uid': user.uid,
          'email': user.email ?? '',
          'displayName': user.displayName ?? '',
          'photoURL': user.photoURL ?? '',
          'createdAt': FieldValue.serverTimestamp(),
          'lastLogin': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'courses': [courseRef1, courseRef2],
        });
      } else {
        await userDocRef.update({
          'lastLogin': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'courses': [courseRef1, courseRef2],
        });
      }
    } on FirebaseException catch (e) {
      throw Exception('Firestore error: ${e.message} (Code: ${e.code})');
    } catch (e) {
      throw Exception('Error creating/updating user document: $e');
    }
  }
  // Updates user document
  Future<void> updateUserData(String uid, Map<String, dynamic> data) async {
    try {
      data.remove('password');
      await _firestore.collection(_usersCollection).doc(uid).set(
        {
          ...data,
          'updatedAt': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
    } on FirebaseException catch (e) {
      throw Exception('Firestore error: ${e.message} (Code: ${e.code})');
    } catch (e) {
      throw Exception('Error updating user data: $e');
    }
  }

  // Creates cards
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

  // Creates course
  Future<String> createCourse(String userId, Map<String, dynamic> courseData) async {
    try {
      final courseDocRef = _firestore.collection(_coursesCollection).doc();
      await courseDocRef.set({
        ...courseData,
        'cards': [],
        'sets': [], // Initialize sets array
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

  // Gets user courses
  Future<List<Map<String, dynamic>>> getUserCourses(String userId) async {
    try {
      final userDoc = await _firestore
        .collection(_usersCollection)
        .doc(userId)
        .get();

      if (!userDoc.exists) {
        return [];
      }

      final courseRefs = userDoc.data()?['courses'] as List<dynamic>? ?? [];
      final courses = <Map<String, dynamic>>[];

      for (final ref in courseRefs) {
        final courseDoc = await (ref as DocumentReference).get();
        if (courseDoc.exists) {
          courses.add({
            'id': courseDoc.id,
            ...courseDoc.data() as Map<String, dynamic>,
          });
        }
      }

      return courses;
    } catch (e) {
      return [];
    }
  }

  // Gets sets in course
  Future<List<Map<String, dynamic>>> getSetsInCourse(String courseId) async {
    try {
      final courseDoc = await _firestore
          .collection(_coursesCollection)
          .doc(courseId)
          .get();

      if (!courseDoc.exists) {
        return [];
      }

      final setRefs = courseDoc.data()?['sets'] as List<dynamic>? ?? [];
      final sets = <Map<String, dynamic>>[];

      for (final ref in setRefs) {
        final setDoc = await (ref as DocumentReference).get();
        if (setDoc.exists) {
          sets.add({
            'id': setDoc.id,
            ...setDoc.data() as Map<String, dynamic>,
          });
        }
      }

      debugPrint('Fetched Sets: $sets');
      return sets;
    } catch (e) {
      return [];
    }
  }

  // Gets user object by userID
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
}

/// Singleton instance of DatabaseService for easy access across the app.
/// Import and use: `dbService.getUserById(uid)`
/// For testing, you can inject a mock Firestore instance: `DatabaseService(firestore: mockFirestore)`
final DatabaseService dbService = DatabaseService();