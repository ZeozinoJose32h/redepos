import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:redepos/helpers/extensions.dart';
import 'package:redepos/model/login_model.dart';
import 'package:redepos/repositories/user_repository.dart';


part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  String? email;

  @action
  setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  String? get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email!.isEmpty) {
      return 'Campo obrigatorio';
    } else
      return 'E-mail inválido';
  }

  @observable
  String? pass;

  @action
  void setPass(String value) => pass = value;

  @computed
  bool get passValid => pass != null && pass!.length >= 6;

  @computed
  bool get isFormValid => passValid && emailValid;

  @computed
  dynamic get loginPressed => _login;

  @observable
  bool loading = false;

  @observable
  String? token;

  @action
  Future<String?> _login() async {
    loading = true;

    final login = Login(
      email: email,
      password: pass,
    );

    token = await UserRepository().login(login);


    loading = false;

    return token;

    /*if(logged == true){
      return true;
    } else {
      return false;
    }
*/

  }

}