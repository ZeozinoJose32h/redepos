import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:redepos/helpers/extensions.dart';
import 'package:redepos/model/user_model.dart';
import 'package:redepos/repositories/user_repository.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {

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
  String? cpf;

  @action
  setCpf(String value) => cpf = value;

  @computed
  bool get cpfValid => email != null;

  String? get cpfError {
    if (cpf == null || cpfValid) {
      return null;
    } else if (cpf!.isEmpty) {
      return 'Campo obrigatorio';
    } else
      return 'CPF inválido';
  }

  @observable
  String? data;

  @action
  setData(String value) => data = value;

  @computed
  bool get dataValid => data != null;

  String? get dataError {
    if (data == null || dataValid) {
      return null;
    } else if (data!.isEmpty) {
      return 'Campo obrigatorio';
    } else
      return 'Data inválido';
  }

  @observable
  String? phone;

  @action
  setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone!.length >= 14;

  String? get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone!.isEmpty) {
      return 'Campo obrigatorio';
    } else
      return 'Telefone inválido';
  }

@observable
String? cep;

@action
setCep(String value) => cep = value;

@computed
bool get cepValid => cep != null;

String? get cepError {
  if (cep == null || cepValid) {
    return null;
  } else if (cep!.isEmpty) {
    return 'Campo obrigatorio';
  } else
    return 'CEP inválido';
}


   void userPressed(String? token){
  _user(token!);
  }

  @observable
  bool loading = false;

  @action
  Future _user(String token) async {
    loading = true;

    final user = User(
      name: name,
      email: email,
      cpf: cpf,
      data: data,
      phone: phone,
      cep: cep,
    );

    UserRepository().setValue(user, token);

    await Future.delayed(Duration(seconds: 3));

    loading = false;
  }


  User? model;

  String? token;

  String? userEmail;

  bool? logged;

  setToken(String? value) => token = value;

  setUserEmail(String? value) => userEmail = value;

  Future<String?> decodeJson(var json) async {
    var map = jsonDecode(await json);
    User model = User.fromJson(map);
    if(model.jwttoken == null){
      logged = false;
      return token;
    } else {
      logged = true;
      setUserEmail(model.email);
      setToken(model.jwttoken);
      return token;
    }
  }
  
  Future getAllData(String? token) async {
    model = await UserRepository().getAllData(token!);
  }

  setOneValue(String? token) async {

    final user = User(
      cart: ['item1'],
    );

    model= await UserRepository().setOneValue(user, token!);
  }


  remValue(String? token) async {
    UserRepository().remValue(token!);
  }

}
