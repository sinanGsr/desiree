


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final CollectionReference _userCollection =
  FirebaseFirestore.instance.collection('users');


  User? get currentUser => _auth.currentUser;




  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential authResult = await _auth.signInWithCredential(credential);

        // Check if the user exists in Firestore
        bool userExists = await _checkUserExists(authResult.user!);

        if (userExists) {
          return authResult; // User exists, log in
        } else {
          // User doesn't exist, log out and return false
          await _auth.signOut();
          await googleSignIn.disconnect();
          return null;
        }
      }

      return null;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }
  Future<UserCredential?> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential authResult = await _auth.signInWithCredential(credential);
        await _saveUserData(authResult.user!);


        return authResult;
      }

      return null;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }
  
  


  Future<void> _saveUserData(User user) async {
    final DocumentSnapshot userDoc =
    await _userCollection.doc(user.uid).get();

    if (!userDoc.exists) {
      // User not in Firestore, save the email and user name
      await _userCollection.doc(user.uid).set({
        'id':user.uid,
        'email': user.email,
        'username': user.displayName ?? '',
        // You can add more user data fields as needed
      });
    }
  }

  Future<bool> _checkUserExists(User user) async {
    try {
      final DocumentSnapshot userDoc = await _userCollection.doc(user.uid).get();
      return userDoc.exists;
    } catch (e) {
      print('Error checking user existence: $e');
      return false;
    }
  }




  Future<void> signOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();
  }
}