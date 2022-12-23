import 'package:alerta_mujer/pages/centroEmergencia.dart';
import 'package:alerta_mujer/pages/centroPolicia.dart';
import 'package:alerta_mujer/pages/login.dart';
import 'package:alerta_mujer/pages/principal.dart';
import 'package:alerta_mujer/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'login',
      routes: {
        'login': (_) => Login(),
        'register': (_) => Register(),
        'main': (_) => PrincipalView(),
        'centros': (_) => CentroEmergencia(),
        'policias': (_) => CentroPolicia(),
      },
    );
  }
}
