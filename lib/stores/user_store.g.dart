// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid => (_$nameValidComputed ??=
          Computed<bool>(() => super.nameValid, name: '_UserStore.nameValid'))
      .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid => (_$emailValidComputed ??=
          Computed<bool>(() => super.emailValid, name: '_UserStore.emailValid'))
      .value;
  Computed<bool>? _$cpfValidComputed;

  @override
  bool get cpfValid => (_$cpfValidComputed ??=
          Computed<bool>(() => super.cpfValid, name: '_UserStore.cpfValid'))
      .value;
  Computed<bool>? _$dataValidComputed;

  @override
  bool get dataValid => (_$dataValidComputed ??=
          Computed<bool>(() => super.dataValid, name: '_UserStore.dataValid'))
      .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid => (_$phoneValidComputed ??=
          Computed<bool>(() => super.phoneValid, name: '_UserStore.phoneValid'))
      .value;
  Computed<bool>? _$cepValidComputed;

  @override
  bool get cepValid => (_$cepValidComputed ??=
          Computed<bool>(() => super.cepValid, name: '_UserStore.cepValid'))
      .value;

  final _$nameAtom = Atom(name: '_UserStore.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_UserStore.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$cpfAtom = Atom(name: '_UserStore.cpf');

  @override
  String? get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String? value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$dataAtom = Atom(name: '_UserStore.data');

  @override
  String? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$phoneAtom = Atom(name: '_UserStore.phone');

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$cepAtom = Atom(name: '_UserStore.cep');

  @override
  String? get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String? value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$loadingAtom = Atom(name: '_UserStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_userAsyncAction = AsyncAction('_UserStore._user');

  @override
  Future<dynamic> _user(String token) {
    return _$_userAsyncAction.run(() => super._user(token));
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void setName(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCpf(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setData(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setData');
    try {
      return super.setData(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhone(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCep(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
cpf: ${cpf},
data: ${data},
phone: ${phone},
cep: ${cep},
loading: ${loading},
nameValid: ${nameValid},
emailValid: ${emailValid},
cpfValid: ${cpfValid},
dataValid: ${dataValid},
phoneValid: ${phoneValid},
cepValid: ${cepValid}
    ''';
  }
}
