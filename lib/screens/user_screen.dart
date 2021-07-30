import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:redepos/stores/user_store.dart';
import 'package:redepos/widgets/floating_button.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingButton(),

      body: SingleChildScrollView(child: Observer(builder: (_) {
        return Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Meus dados:",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text("Atualizar meus dados"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Nome:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            initialValue: userStore.model!.name == null
                                ? ''
                                : "${userStore.model!.name}",
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                errorText: userStore.nameError,
                                border: InputBorder.none,
                                hintText: "Nome"),
                            onChanged: userStore.setName,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Email:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            initialValue: userStore.model!.email == null
                                ? ''
                                : "${userStore.model!.email}",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                errorText: userStore.emailError,
                                border: InputBorder.none,
                                hintText: 'Email'),
                            onChanged: userStore.setEmail,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'CPF:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            initialValue: userStore.model!.cpf == null
                                ? ''
                                : "${userStore.model!.cpf}",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                              CpfInputFormatter()
                            ],
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                errorText: userStore.cpfError,
                                border: InputBorder.none,
                                hintText: "CPF"),
                            onChanged: userStore.setCpf,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Data de Nascimento:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            initialValue: userStore.model!.data == null
                                ? ''
                                : "${userStore.model!.data}",
                            keyboardType: TextInputType.datetime,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                              DataInputFormatter()
                            ],
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                errorText: userStore.dataError,
                                border: InputBorder.none,
                                hintText: "Data de Nasc."),
                            onChanged: userStore.setData,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Telefone:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            initialValue: "${userStore.model!.phone}",
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter()
                            ],
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                errorText: userStore.phoneError,
                                border: InputBorder.none,
                                hintText: "Telefone"),
                            onChanged: userStore.setPhone,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'CEP:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            initialValue: userStore.model!.cep == null
                                ? ''
                                : "${userStore.model!.cep}",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                              CepInputFormatter()
                            ],
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                errorText: userStore.cepError,
                                border: InputBorder.none,
                                hintText: "CEP"),
                            onChanged: userStore.setCep,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal, onPrimary: Colors.black),
                        onPressed: () {
                          userStore.userPressed(userStore.token);
                          final snackBar = SnackBar(
                            content: Text(
                              'Dados atualizados',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.blueGrey,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Center(
                            child: Text(
                          "Atualizar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
            ));
      })),
    );
  }
}
