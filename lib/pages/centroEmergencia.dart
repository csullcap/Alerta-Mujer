import 'package:alerta_mujer/models/centros.dart';
import 'package:flutter/material.dart';

class CentroEmergencia extends StatelessWidget {
  List<Centros> centrosEmergencia = [
    Centros(
        image:
            "https://diariovoces.com.pe/wp-content/uploads/2014/02/MinistraCemDorado_03.jpg",
        titulo: "CENTRO PNP EL TRIUNFO AREQUIPA",
        direccion: "AV LAS PALMEIRAS LOS OLIVOS 113",
        coordinador: "PUMACAYO ROCHA ERICK ROLANDO"),
    Centros(
        image:
            "https://diariovoces.com.pe/wp-content/uploads/2014/02/MinistraCemDorado_03.jpg",
        titulo: "CENTRO PNP EL TRIUNFO AREQUIPA",
        direccion: "AV LAS PALMEIRAS LOS OLIVOS 113",
        coordinador: "PUMACAYO ROCHA ERICK ROLANDO"),
    Centros(
        image:
            "https://diariovoces.com.pe/wp-content/uploads/2014/02/MinistraCemDorado_03.jpg",
        titulo: "CENTRO PNP EL TRIUNFO AREQUIPA",
        direccion: "AV LAS PALMEIRAS LOS OLIVOS 113",
        coordinador: "PUMACAYO ROCHA ERICK ROLANDO"),
    Centros(
        image:
            "https://diariovoces.com.pe/wp-content/uploads/2014/02/MinistraCemDorado_03.jpg",
        titulo: "CENTRO PNP EL TRIUNFO AREQUIPA",
        direccion: "AV LAS PALMEIRAS LOS OLIVOS 113",
        coordinador: "PUMACAYO ROCHA ERICK ROLANDO"),
    Centros(
        image:
            "https://diariovoces.com.pe/wp-content/uploads/2014/02/MinistraCemDorado_03.jpg",
        titulo: "CENTRO PNP EL TRIUNFO AREQUIPA",
        direccion: "AV LAS PALMEIRAS LOS OLIVOS 113",
        coordinador: "PUMACAYO ROCHA ERICK ROLANDO"),
    Centros(
        image:
            "https://diariovoces.com.pe/wp-content/uploads/2014/02/MinistraCemDorado_03.jpg",
        titulo: "CENTRO PNP EL TRIUNFO AREQUIPA",
        direccion: "AV LAS PALMEIRAS LOS OLIVOS 113",
        coordinador: "PUMACAYO ROCHA ERICK ROLANDO"),
    Centros(
        image:
            "https://diariovoces.com.pe/wp-content/uploads/2014/02/MinistraCemDorado_03.jpg",
        titulo: "CENTRO PNP EL TRIUNFO AREQUIPA",
        direccion: "AV LAS PALMEIRAS LOS OLIVOS 113",
        coordinador: "PUMACAYO ROCHA ERICK ROLANDO"),
    Centros(
        image:
            "https://diariovoces.com.pe/wp-content/uploads/2014/02/MinistraCemDorado_03.jpg",
        titulo: "CENTRO PNP EL TRIUNFO AREQUIPA",
        direccion: "AV LAS PALMEIRAS LOS OLIVOS 113",
        coordinador: "PUMACAYO ROCHA ERICK ROLANDO"),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 124, 200),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 223, 27, 13),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10)),
                      onPressed: () => {Navigator.pushNamed(context, 'main')},
                      child: const Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                    ),
                    Text("Centros de emergencia",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
                GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 6),
                  itemCount: centrosEmergencia.length,
                  itemBuilder: (context, index) {
                    final CentroEmergencia = centrosEmergencia[index];
                    return buildCard(context, CentroEmergencia);
                  },
                )
              ]),
        ));
  }
}

Widget buildCard(BuildContext context, Centros center) {
  return GestureDetector(
    onTap: () {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: ClipRRect(
                        child: Image.network(
                          center.image!,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          center.titulo!,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("DIRECCION:  ${center.direccion!}",
                            style: TextStyle(fontSize: 15)),
                        Text("COORDINADOR:  ${center.coordinador!}",
                            style: TextStyle(fontSize: 15)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 82, 228, 238),
                                ),
                                label: const Text("Atras"))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          });
    },
    child: SizedBox(
        width: 300,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            center.image!,
            fit: BoxFit.cover,
          ),
        )),
  );
}
