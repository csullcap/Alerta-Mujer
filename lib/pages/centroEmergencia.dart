import 'package:alerta_mujer/models/centros.dart';
import 'package:flutter/material.dart';

class CentroEmergencia extends StatelessWidget {
  List<Centros> centrosEmergencia = [
    Centros(
        image:
            "https://elobservadorenlinea.com/wp-content/uploads/2017/02/CentroEscucha.jpg",
        titulo: "Escucha a las víctimas",
        direccion:
            "Reconocer que hemos sido víctimas de la violencia puede ser difícil, por lo que si algún familiar o conocida se anima a contarte su experiencia, ¡escúchala! Cuando una mujer o una niña -a quienes se les hace más difícil- comparte su historia, está dando el primer paso para romper el ciclo de maltrato",
        coordinador: ""),
    Centros(
        image:
            "https://www.planinternational.org.pe/hubfs/IMG_BLOG_PORTADA_12.jpg",
        titulo: "Educa a tu comunidad y familiares",
        direccion:
            "Hablar sobre el consentimiento, el impacto de la violencia y cómo intervenir de manera segura, son algunos de los puntos más importantes que puedes abordar. ONU Mujeres recomienda iniciar conversaciones sobre los roles de género a una edad temprana y cuestionar las características tradicionales asignadas a hombres y mujeres.",
        coordinador: ""),
    Centros(
        image:
            "https://diariovoces.com.pe/wp-content/uploads/2014/02/MinistraCemDorado_03.jpg",
        titulo: "Exige respuestas y servicios adecuados para las víctimas",
        direccion:
            "Aunque en el Perú existen líneas telefónicas e instituciones que atienden los casos de violencia contra la mujer, muchas veces su respuesta no es inmediata. Es nuestro deber como ciudadanxs exigir que se destine el presupuesto adecuado a estos servicios y que se garantice la atención igualitaria ",
        coordinador: ""),
    Centros(
        image:
            "https://fotografias-compromiso.atresmedia.com/clipping/cmsimages01/2021/11/07/8D7E840D-8D2D-4171-82BD-E943A3D412CF/58.jpg",
        titulo: "Reconoce las señales de violencia",
        direccion:
            "Existen muchas formas distintas de violencia y todas pueden afectar de forma física y emocional. Aprender a identificar las señales es importante para ayudar a esa amiga, conocida o familiar a salir de este tipo de situaciones, sin poner en riesgo su integridad. ",
        coordinador: ""),
    Centros(
        image:
            "https://www.planinternational.org.pe/hs-fs/hubfs/IMG_BLOG_INTERNAS_12_02.jpg?width=600&name=IMG_BLOG_INTERNAS_12_02.jpg",
        titulo: "Crea un plan de intervención",
        direccion:
            "Desarrolla tu propio plan personal para reaccionar de forma inmediata ante posibles casos de violencia o mensajes de auxilio de una víctima. Debes tener los números de contacto necesarios de la policía local, la línea nacional de ayuda contra la violencia de género",
        coordinador: "")
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: const Color.fromRGBO(248, 206, 205, 1),
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
                          primary: Color.fromRGBO(187, 83, 98, 1),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10)),
                      onPressed: () => {Navigator.pushNamed(context, 'main')},
                      child: const Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                    ),
                    Text("Recomendaciones",
                        style: TextStyle(
                            color: Color.fromRGBO(187, 83, 98, 1),
                            fontSize: 23,
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
          backgroundColor: Color.fromRGBO(248, 206, 205, 1),
          builder: (BuildContext context) {
            return SizedBox(
              height: 800,
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
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(187, 83, 98, 1)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(" ${center.direccion!}",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(197, 120, 130, 1))),
                        SizedBox(
                          height: 3,
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
                                  primary: Color.fromRGBO(187, 83, 98, 1),
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
        height: 20,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            center.image!,
            fit: BoxFit.cover,
          ),
        )),
  );
}
