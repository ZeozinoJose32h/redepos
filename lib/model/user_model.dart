class User {
  User(
      {this.jwttoken,
      this.name,
      this.email,
      this.cpf,
      this.data,
      this.phone,
      this.cep,
      this.cart});

  String? jwttoken;
  String? name;
  String? email;
  String? cpf;
  String? data;
  String? phone;
  String? cep;
  List? cart;

  User.fromJson(Map<String, dynamic> json) {
    jwttoken = json['jwttoken'];
    name = json['name'];
    email = json['email'];
    cpf = json['cpf'];
    data = json['data'];
    phone = json['phone'];
    cep = json['cep'];
  }
}