import 'package:flutter/material.dart';
import 'package:alerta_mujer/Widgets/HeaderLogin.dart';
import 'package:alerta_mujer/Widgets/widgets.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff284855),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            HeaderLogin(),
            Positioned(
                top: 60,
                left: 20,
                child: const TextFrave(
                    text: 'Crear una',
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            Positioned(
                top: 110,
                left: 20,
                child: const TextFrave(
                    text: 'Cuenta',
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            BottomRegister(),
            Positioned(
                top: 250,
                child: _TextFieldCustom(label: 'Nombre', isPass: false)),
            Positioned(
                top: 320,
                child: _TextFieldCustom(
                    label: 'Correo Electronico', isPass: false)),
            Positioned(
                top: 390,
                child: _TextFieldCustom(label: 'Contraseña', isPass: true)),
            Positioned(
                top: 460,
                child: _TextFieldCustom(
                    label: 'Confirmar Contraseña', isPass: true)),
            Positioned(
                top: 550,
                left: 15,
                child: TextButton(
                    onPressed: () {},
                    child: const TextFrave(
                        text: 'Registrarme',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold))),
            Positioned(
                top: 720,
                left: 15,
                child: Row(
                  children: [
                    const TextFrave(
                        text: '¿ Ya tienes una cuenta ? ',
                        color: Colors.white,
                        fontSize: 17),
                    GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'login'),
                        child: const TextFrave(
                            text: 'Iniciar sesión',
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class _TextFieldCustom extends StatelessWidget {
  final String label;
  final bool isPass;

  const _TextFieldCustom({required this.label, required this.isPass});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        child: TextField(
          obscureText: isPass,
          decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ),
      ),
    );
  }
}
