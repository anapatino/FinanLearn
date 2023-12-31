import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finanlearn/domain/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRequest {
  static final FirebaseFirestore database = FirebaseFirestore.instance;
  static final FirebaseAuth authentication = FirebaseAuth.instance;

  static Future<UserCredential> login(String email, String password) async {
    try {
      return await authentication.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('El usuario no existe');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña incorrecta');
      } else if (e.code == 'The email address is badly formatted') {
        return Future.error(
            'La dirección de correo electrónico está mal formateada');
      }
    }
    return Future.error('Error al ingresar');
  }

  static Future<UserCredential> register(
      String firstName, String lastName, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await saveUserData(userCredential.user!.uid, firstName, lastName, email);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('La contraseña es demasiado debil');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('Ya existe una cuenta con este email');
      }
    }
    return Future.error('Error al autenticar el usuario');
  }

  static Future<void> saveUserData(
      String userId, String firstName, String lastName, String email) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(userId).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      });
    } catch (e) {
      throw Future.error('Error al registrar usuario en la base de datos');
    }
  }

  static Future<Users> findUser(String email) async {
    Users? user;
    await database.collection('user').get().then((value) {
      for (var doc in value.docs) {
        if (doc.data()['email'] == email) {
          user = Users.fromJson(doc.data());
        }
      }
    });
    return user!;
  }
}
