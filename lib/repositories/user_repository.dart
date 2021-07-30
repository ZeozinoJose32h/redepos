import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redepos/model/login_model.dart';
import 'package:redepos/model/signup_model.dart';
import 'package:http/http.dart' as http;
import 'package:redepos/model/user_model.dart';
import 'package:redepos/repositories/const_keys.dart';
import 'package:redepos/stores/user_store.dart';


class UserRepository {

  UserStore userStore = UserStore();

  String? userToken;

  Future signUp(UserSignUp user) async {
    var url = Uri.parse(UrlSignUp);

    var body = jsonEncode({
      'apptoken': AppToken,
      'name': user.name,
      'password': user.password,
      'email': user.email,
    });

    var response = await http.post(url, body: body);

    //implement error handling
  }

  Future login(Login login) async {
    var url = Uri.parse(UrlLogin);

    var body = jsonEncode({
      "apptoken": AppToken,
      "password": login.password,
      "email": login.email
    });

    var response = await http.post(url, body: body);

    var token = await userStore.decodeJson(response.body);

    return token;


    //implement error handling
  }

  Future setValue(User user, String token) async {
    var url = Uri.parse(UrlSetValue);

    var map = {
      'name': user.name,
      'email': user.email,
      'cpf': user.cpf,
      'data': user.data,
      'phone': user.phone,
      'cep': user.cep
    };

    map.forEach((key, value) async {
      var body = jsonEncode({
        'key' : key,
        'value' : value
      });
      var response = await http.post(url, body: body, headers: {'Token' : '$token'});
    });
    //implement error handling
  }

  Future getAllData(String token) async {
    var url = Uri.parse(UrlGetAllData);

    var body = jsonEncode({});


    var response = await http.post(url, body: body, headers: {'Token' : '$token'});

    var map = jsonDecode(response.body);

    User model = User.fromJson(map['data']);

    return model;
    //implement error handling
  }

  Future setOneValue(User user, String token) async {
    var url = Uri.parse(UrlSetValue);

    var body = jsonEncode({
      'key' : 'cart',
      'value' : "${user.cart}"
    });
    var response = await http.post(url, body: body, headers: {'Token' : '$token'});
    print(response.body);

  }

  Future remValue(String token) async {
    var url = Uri.parse(UrlRemValue);

    var body = jsonEncode({
      "key" : "cart",
    });
    var response = await http.post(url, body: body, headers: {'Token' : '$token'});

    print(response.body);

  }

}