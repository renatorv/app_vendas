import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  // usuário Atual

  // Essa instância é um Singleton, ou seja,
  // existe somente uma instância do objeto no app
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;

  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  // VoidCallback: função que será passada
  void signUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((user) async {
      firebaseUser = user;
      await _saveUserData(userData);
      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void signIn() {
    isLoading = true;
    notifyListeners();

    Future.delayed(Duration(seconds: 5));

    isLoading = false;
    notifyListeners();
  }

  void recoverPass() {}

  // Se o usuário atual for diferente de null
  // essa função retorna true, indicando que
  // o usuário está logado
  bool isLogggedIn() {
    return firebaseUser != null;
  }

  void signOut() async {
    await _auth.signOut();

    // Resetando os dados do usuários
    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance
        .collection("users")
        .document(firebaseUser.uid)
        .setData(userData);
  }
}
