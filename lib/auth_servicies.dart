import 'dart:developer';
import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleServicies {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
        'profile',
      ],
      clientId: Platform.isAndroid
          ? "395476353112-cl2dt2vafk7s6jhvsoumpffa7331p2fq.apps.googleusercontent.com"
          : "395476353112-5kkg04db60gae0g4afug35g0r8voklls.apps.googleusercontent.com",
      serverClientId:
          "395476353112-ac70ta1v1amgi7kmcip34cuqe5kget0l.apps.googleusercontent.com");

  Future<GoogleSignInAccount?> handleSignIn() async {
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      log(error.toString());
    }
    return null;
  }
}
