import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:banner_carousel/banner_carousel.dart';

class PrincipalView extends StatefulWidget {
  PrincipalView({Key? key}) : super(key: key);

  @override
  _PrincipalView createState() => _PrincipalView();
}

class _PrincipalView extends State<PrincipalView> {
  final GlobalKey<AnimatedFloatingActionButtonState> key =
      GlobalKey<AnimatedFloatingActionButtonState>();
  final String recomendacion = "Para emergencias marque la linea 100.";
  final String centro = "Centro de emergencia mujer mas cercano";
  final String policia = "Estacion policial mas cercana";
  final String CEM = 'centro+de+emergencia+mujer+mas+cercano';
  final String COMISARIA = 'comisaría+mas+cercana';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 206, 205, 1),
      floatingActionButton: AnimatedFloatingActionButton(
        key: key,
        fabButtons: <Widget>[
          cntros_emergencia(),
          comisarias(),
          recomendaciones(),
        ],
        colorStartAnimation: Color.fromRGBO(187, 83, 98, 1),
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close,
      ),
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
                          color: Color.fromRGBO(187, 83, 98, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.login_sharp),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(187, 83, 98, 1),
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
                      color: Color.fromRGBO(197, 120, 130, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.normal)),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(187, 83, 98, 1),
                      shape: const CircleBorder(),
                      side: const BorderSide(
                          width: 4, color: Color.fromRGBO(187, 83, 98, 1)),
                      padding: const EdgeInsets.all(50)),
                  onPressed: _callNumber,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.local_phone_rounded,
                        size: 100,
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
                height: 30,
              ),
              BannerCarousel.fullScreen(
                banners: BannerImages.listBanners,
                height: 260,
                borderRadius: 25,
                animation: true,
                initialPage: 1,
                customizedIndicators: IndicatorModel.animation(
                    width: 20, height: 5, spaceBetween: 2, widthAnimation: 50),
                activeColor: Color.fromRGBO(197, 120, 130, 0.9),
                disableColor: Color.fromRGBO(197, 120, 130, 0.5),
                // OR pageController: PageController(initialPage: 6),
              ),
            ]),
      ),
    );
  }

  Widget cntros_emergencia() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(197, 120, 130, 1),
        onPressed: () {
          _openMap(CEM);
        },
        heroTag: null,
        tooltip: 'Centros',
        child: Icon(Icons.home_work),
      ),
    );
  }

  Widget comisarias() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(197, 120, 130, 1),
        onPressed: () => _openMap(COMISARIA),
        heroTag: null,
        tooltip: 'Comisarias',
        child: Icon(Icons.policy),
      ),
    );
  }

  Widget recomendaciones() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(197, 120, 130, 1),
        onPressed: () => {Navigator.pushNamed(context, 'centros')},
        heroTag: null,
        tooltip: 'Recomendaciones',
        child: Icon(Icons.dashboard),
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

class BannerImages {
  static const String banner1 =
      "https://i0.wp.com/ugelhuancayo.gob.pe/wp-content/uploads/2021/04/CygvV8FWQAAmwpG-1.jpg";
  static const String banner2 =
      "https://undac.edu.pe/wp-content/uploads/2021/02/01-CEM-01-1024x810.png";
  static const String banner3 =
      "https://munibambamarca.gob.pe/wp-content/uploads/2021/02/01-39-1024x435.jpg";
  static const String banner4 =
      "https://www.muniporvenir.gob.pe/wp-content/uploads/2021/05/mentoras.jpg";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
    BannerModel(imagePath: banner4, id: "4"),
  ];
}
