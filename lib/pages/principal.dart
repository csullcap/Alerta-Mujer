import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class PrincipalView extends StatelessWidget {
  final String recomendacion =
      "Recuerda: Si quieres realizar una llamada de emergencia a la linea #100 solo pulse el boton redondo";
  final String centro = "Centro de emergencia mujer mas cercano";
  final String policia = "Estacion policial mas cercana";
  final String CEM = 'centro+de+emergencia+mujer+mas+cercano';
  final String COMISARIA = 'comisaria+mas+cercana';

  const PrincipalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 124, 200),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Bienvenida",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.login_sharp),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color.fromARGB(255, 82, 228, 238),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        label:
                        const Text('Salir', style: TextStyle(fontSize: 16)),
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(recomendacion,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal)),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 223, 27, 13),
                      shape: const CircleBorder(),
                      side: const BorderSide(width: 4, color: Colors.white),
                      padding: const EdgeInsets.all(50)),
                  onPressed: _callNumber,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.local_phone_rounded,
                        size: 150,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Llamar linea 100",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => _openMap(CEM),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor:
                              const Color.fromARGB(255, 82, 228, 238),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: const Icon(
                            Icons.maps_home_work_outlined,
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          centro,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () => _openMap(COMISARIA),
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(8.0),
                                primary: Color.fromARGB(255, 82, 228, 238),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: const Icon(
                              size: 50,
                              Icons.maps_home_work_outlined,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            policia,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ))
                ],
              )
            ]),
      ),
    );
  }
}

_callNumber() async {
  const number = '100';
  await FlutterPhoneDirectCaller.callNumber(number);
}

_openMap(String type) async {
  if (Platform.isAndroid) {
    var url = Uri.parse("google.navigation:q=$type");
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not open the map.';
    }
  } else if (Platform.isIOS) {

    //final url = 'https://maps.apple.com/?q=$type';
    var url = Uri.parse("maps://?q=$type");
  }
}
