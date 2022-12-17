import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class Authcontroller extends GetxController{
  Authcontroller();
  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) Get.offAllNamed('login');
    });
  }
  User? get currentUser => FirebaseAuth.instance.currentUser;
}