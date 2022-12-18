import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class PrincipalView extends StatelessWidget {
  final String recomendacion =
      "Recuerda: Si quieres realizar una llamada de emergencia a la linea #100 solo pulse el boton redondo";
  final String centro = "Centro de emergencia mujer mas cercano";
  final String policia = "Estacion policial mas cercana";
  final String CEM = 'centro+de+emergencia+mujer+mas+cercano';
  final String COMISARIA = 'comisaría+mas+cercana';

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

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

Future<void> _openMap(String type) async {
  final position = await _determinePosition();
  final lat = position.latitude;
  final long = position.longitude;

  if (Platform.isAndroid) {
    final url = 'https://www.google.com/maps/dir/$lat,$long/$type';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } else if (Platform.isIOS) {
    final url = 'https://maps.apple.com/?saddr=$lat,$long&daddr=$type';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
