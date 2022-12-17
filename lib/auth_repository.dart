import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  const AuthRepository();
  Future<UserCredential> signInWithEmail(
    String email,
    String password,
      );


}