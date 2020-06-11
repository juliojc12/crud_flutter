import 'package:crud_cod3r/models/user.dart';
import 'package:crud_cod3r/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: "Nome:"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }
                  if (value.trim().length < 3) {
                    return 'Nome muito curto (mínimo 3 caracteres)';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: "E-mail:"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Por favor use um e-mail válido";
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: "Avatar:"),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: RaisedButton.icon(
                    onPressed: () {
                      final isValid = _form.currentState.validate();

                      if (isValid) {
                        _form.currentState.save();
                        Provider.of<Users>(context, listen: false).put(
                          User(
                            id: _formData['id'],
                            name: _formData['name'],
                            email: _formData['email'],
                            avatarUrl: _formData['avatarUrl'],
                          ),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    icon: Icon(Icons.save, color: Colors.white,),
                    label: Text("Salvar", style: TextStyle(color: Colors.white), ),
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
