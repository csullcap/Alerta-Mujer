import 'package:flutter/material.dart';
import 'package:alerta_mujer/Widgets/HeaderLogin.dart';
import 'package:alerta_mujer/Widgets/widgets.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            HeaderLogin(),
            Positioned(
                top: 60,
                left: 20,
                child: const TextFrave(
                    text: 'SOS Alerta',
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            Positioned(
                top: 110,
                left: 20,
                child: const TextFrave(
                    text: 'Mujer',
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            BottomLogin(),
            Positioned(
                top: 270,
                child: _TextFieldCustom(
                    label: 'Correo Electronico', isPass: false)),
            Positioned(
                top: 340,
                child: _TextFieldCustom(label: 'Contraseña', isPass: true)),
            Positioned(
                top: 460,
                left: 15,
                child: TextButton(
                    onPressed: () {},
                    child: TextFrave(
                        text: 'Ingresar',
                        color: Colors.grey[700]!,
                        fontSize: 25,
                        fontWeight: FontWeight.bold))),
            Positioned(
                top: 720,
                left: 15,
                child: Row(
                  children: [
                    const TextFrave(
                        text: '¿No tienes una cuenta? ',
                        color: Colors.white,
                        fontSize: 17),
                    GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'register'),
                        child: const TextFrave(
                            text: 'Registrate',
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
              labelStyle: TextStyle(color: Colors.grey[700]),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[700]!))),
        ),
      ),
    );
  }
}
