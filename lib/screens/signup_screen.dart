import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: "Nome Completo"),
                validator: (text) {
                  if (text.isEmpty) return "Nome inválido!";
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(hintText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text.isEmpty || !text.contains("@"))
                    return "E-mail inválido!";
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(hintText: "Senha"),
                obscureText: true,
                validator: (texto) {
                  if (texto.isEmpty || texto.length < 6)
                    return "Senha inválida!";
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(hintText: "Endereço"),
                validator: (texto) {
                  if (texto.isEmpty )
                    return "Endereço inválido!";
                },
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 44.0,
                child: RaisedButton(
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
