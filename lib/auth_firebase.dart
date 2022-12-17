import 'package:firebase_auth/firebase_auth.dart';
import 'package:alerta_mujer/auth_repository.dart';

class AuthFirebase implements AuthRepository {
  const AuthFirebase();

  @override
  Future<UserCredential> signInWithEmail(
    String email,
    String password,
  ) async {
    final auth = FirebaseAuth.instance;
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}