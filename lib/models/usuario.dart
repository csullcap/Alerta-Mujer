import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String? nombre;
  String? apellido;
  String? departamento;
  String? email;
  String? contrasena;
  DocumentReference? reference;
// added '?'

  Usuario({this.nombre, this.apellido, this.departamento, this.email, this.contrasena});
// can also add 'required' keyword
  Usuario.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>, reference: snapshot.reference);

  Usuario.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['nombre'] != null),
        assert(map['apellido'] != null),
        assert(map['departamento'] != null),
        assert(map['email'] != null),
        assert(map['contrasena'] != null),
        nombre = map['nombre'],
        apellido = map['apellido'],
        departamento = map['departamento'],
        email = map['email'],
        contrasena = map['contrasena'];


}
