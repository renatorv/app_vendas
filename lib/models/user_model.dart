import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  // usuário Atual

  bool isLoading = false;

  void signUp() {}

  void signIn() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 5));

    isLoading = false;
    notifyListeners();
  }

  void recoverPAss() {}

  // bool isLogggedIn(){

  // }
}
