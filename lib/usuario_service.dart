import 'package:alerta_mujer/models/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioServicio {
  get(String correo) async{
    return null;
  }
  add (Usuario user) async {
    try{
    var existe = await get(user.email!);
      if (existe != null) {
        print('El usuario ya existe');
        return existe;
      }
      await FirebaseFirestore.instance.collection('usuarios').add({
      'nombre': user.nombre,
      'apellido': user.apellido,
      'departamento': user.departamento,
      'correoelectronico': user.email,
      'contrasena': user.contrasena,
    });
    }catch(e){
      print(e);
    }



  }
}