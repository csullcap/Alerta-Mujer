import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 124, 200),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 650,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 223, 27, 13),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60.0),
                            bottomLeft: Radius.circular(60.0),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Registrate",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Nombre",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 238, 238, 238)),
                                    prefixIcon: Icon(
                                      Icons.supervisor_account,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Apellidos",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 238, 238, 238)),
                                    prefixIcon: Icon(
                                      Icons.supervisor_account,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Departamento",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 238, 238, 238)),
                                    prefixIcon: Icon(
                                      Icons.map,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: "Correo electronico",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 238, 238, 238)),
                                    prefixIcon: Icon(
                                      Icons.alternate_email,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                style: TextStyle(color: Colors.white),
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Contraseña",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 238, 238, 238)),
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    focusedBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 50,
                                      width: 300,
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(
                                                255, 82, 228, 238),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                        child: const Text('Registrarse',
                                            style: TextStyle(fontSize: 18)),
                                        onPressed: () {
                                          Navigator.pushNamed(context, 'main');
                                        },
                                      )),
                                ],
                              )
                            ]),
                      ),
                    ),
                  ],
                ))));
  }
}
