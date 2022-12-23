import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alerta_mujer/pages/principal.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Loginstate createState() => _Loginstate();
}

class _Loginstate extends State<Login> {
  var loading = false;

  void _loginWithGoogle() async {
    setState(() {
      loading = true;
    });
    String email = '';
    String? name = '';
    final serviceId = 'service_fhj23fq';
    final template = 'template_z3rlvga';
    final userId = 'O6ZargfokVhvblZCi';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        setState(() {
          loading = false;
        });
        return;
      }
      final googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(googleAuthCredential);
      await FirebaseFirestore.instance.collection('usuarios').add({
        'name': googleSignInAccount.displayName,
        'email': googleSignInAccount.email,
      });
      email = googleSignInAccount.email;
      name = googleSignInAccount.displayName;

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => PrincipalView()), (route) => false);
    } on FirebaseAuthException catch (e) {
      print(e);
    } finally {
      setState(() {
        loading = false;
      });
    }
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': template,
          'user_id': userId,
          'template_params': {
            'email': email,
            'name': name,
          }
        }));
    print(email);
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "images/login.png",
                  height: 400.0,
                  width: 400.0,
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 380,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(248, 206, 205, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bienvenida",
                          style: TextStyle(
                              color: Color.fromRGBO(187, 83, 98, 1),
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Inicio de sesión",
                          style: TextStyle(
                            color: Color.fromRGBO(187, 83, 98, 0.6),
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        //  INGRESAR CORREO ELECTRONICO
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  side: BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(187, 83, 98, 0.6))),
                              onPressed: () {
                                _loginWithGoogle();
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image:
                                          AssetImage("images/google_logo.png"),
                                      height: 18.0,
                                      width: 24,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 24, right: 8),
                                      child: Text(
                                        'Iniciar sesion con Google',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromRGBO(187, 83, 98, 0.8),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
