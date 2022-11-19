import 'package:flutter/material.dart';

class PrincipalView extends StatelessWidget {
  String recomendacion =
      "Recuerda: Si quieres realizar una llamada de emergencia a la linea #100 solo pulse el boton redondo";
  String centro = "Centro de emergencia mujer mas cercano";
  String policia = "Estacion policial mas cercana";

  @override
  Widget build(BuildContext context) {
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
                  Text("Bienvenida",
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
                            primary: Color.fromARGB(255, 82, 228, 238),
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
              SizedBox(
                height: 30,
              ),
              Text(recomendacion,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal)),
              SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 223, 27, 13),
                      shape: const CircleBorder(),
                      side: BorderSide(width: 4, color: Colors.white),
                      padding: const EdgeInsets.all(50)),
                  child: Column(
                    children: [
                      const Icon(
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
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'centros');
                          },
                          child: Icon(
                            Icons.maps_home_work_outlined,
                            size: 50,
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8.0),
                              primary: Color.fromARGB(255, 82, 228, 238),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
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
                            onPressed: () {
                              Navigator.pushNamed(context, 'policias');
                            },
                            child: Icon(
                              Icons.maps_home_work_outlined,
                              size: 50,
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(8.0),
                                primary: Color.fromARGB(255, 82, 228, 238),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
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
