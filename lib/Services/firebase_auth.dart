import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential cred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = cred.user;
      return user;
    } on FirebaseAuthException {
      // If you get an error, you can handle it here
      // but I rethrow it to let the caller handle it

      // FirebaseAuthException has a code and message
      // For more details, please double-click on signInWithEmailAndPassword method
      // to see the full list of codes and messages
      rethrow;
    }
  }

  static Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential cred = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = cred.user;
      return user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  // IMPORTANT: Please ensure your machine's SH1 key has been configured on your devices
  // See: https://firebase.flutter.dev/docs/auth/social#google
  // and https://firebase.flutter.dev/docs/manual-installation/android#generating-firebase-credentials

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return _firebaseAuth.signInWithCredential(credential);
  }

  // current user
  static User getCurrentUser() {
    User user = _firebaseAuth.currentUser!;
    return user;
  }

  static String getEmail() {
    return _firebaseAuth.currentUser!.email.toString();
  }

  static Future<void> signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
