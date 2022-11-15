import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  GoogleSignInAuthentication googleAuth;

  Future googleSignin() async {
    try {
      final GoogleSignInAccount googleUser =
          await GoogleSignIn(scopes: <String>["email"]).signIn();

      if (googleUser == null) return;
      googleAuth = await googleUser?.authentication;

      final data = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(data);

      return user;
    } catch (e) {
      print('Failed with error code: $e}');
      print(e);
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
