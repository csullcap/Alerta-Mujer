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
  void _loginWithGoogle() async{
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
      if(googleSignInAccount == null ){
        setState(() {
          loading = false;
        });
        return;
      }
      final googleSignInAuthentication = await googleSignInAccount.authentication;
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

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const PrincipalView()),(route) => false);
    } on FirebaseAuthException catch (e) {
      print(e);
    } finally{
      setState(() {
        loading = false;
      });
    }
    final response = await http.post(url,
        headers: {
          'origin' : 'http://localhost',
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
        })
    );
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
                  height: 400,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 124, 200),
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
                          "Bienvenido",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Inicio de sesión",
                          style: TextStyle(
                            color: Color.fromARGB(255, 223, 27, 13),
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //  INGRESAR CORREO ELECTRONICO
                        TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: "Ingrese su correo electronico",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 238, 238, 238)),
                              prefixIcon: Icon(
                                Icons.alternate_email,
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.0)),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //  INGRESAR CORREO CONTRASEÑA
                        TextField(
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Ingrese su contraseña",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 238, 238, 238)),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.0)),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 50,
                                padding:
                                const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                      Color.fromARGB(255, 82, 228, 238),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20))),
                                  child: const Text('Ingresar',
                                      style: TextStyle(fontSize: 18)),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'main');
                                  },
                                )),
                            Container(
                                height: 50,
                                padding:
                                const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 223, 27, 13),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20))),
                                  child: const Text('Registrarse',
                                      style: TextStyle(fontSize: 18)),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                                height: 50,
                                padding:
                                const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 223, 27, 13),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20))),
                                  child: const Text('Google',
                                      style: TextStyle(fontSize: 18)),
                                  onPressed: () {
                                    _loginWithGoogle();
                                  },
                                )),
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
