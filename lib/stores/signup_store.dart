import 'package:mobx/mobx.dart';
import 'package:redepos/helpers/extensions.dart';
import 'package:redepos/model/signup_model.dart';
import 'package:redepos/repositories/user_repository.dart';

part 'signup_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name!.length > 6;

  String? get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name!.isEmpty) {
      return 'Campo obrigatorio';
    } else
      return 'Nome muito curto';
  }

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
  String? pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1!.isPassValid();

  String? get pass1Error {
    if (pass1 == null || pass1Valid) {
      return null;
    } else if (pass1!.isEmpty) {
      return 'Campo obrigatório';
    } else
      return 'Senha invalida';
  }

  @observable
  String? pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;

  String? get pass2Error {
    if (pass2 == null || pass2Valid) {
      return null;
    } else
      return 'Senhas não coincidem';
  }

  @computed
  bool get isFormValid => nameValid && emailValid && pass1Valid && pass2Valid;

  @computed
  dynamic get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;

  @action
  Future<void> _signUp() async {
    loading = true;

    final user = UserSignUp(
      name: name,
      email: email,
      password: pass1
    );

    UserRepository().signUp(user);

    await Future.delayed(Duration(seconds: 3));

    loading = false;
  }
}
