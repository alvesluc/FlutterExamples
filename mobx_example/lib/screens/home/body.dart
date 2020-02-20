import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_test/controller/controller.dart';
//import 'package:provider/provider.dart';

class BodyWidget extends StatelessWidget {

   _textField({String labelText, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<Controller>();
    //final controller = Provider.of<Controller>(context);

    return Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Observer(builder: (_) {
              return _textField(
                  errorText: controller.validateName,
                  labelText: "Name",
                  onChanged: controller.client.changeName);
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return _textField(
                  errorText: controller.validateCPF,
                  labelText: "CPF",
                  onChanged: controller.client.changeCPF);
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return _textField(
                  errorText: controller.validateEmail,
                  labelText: "E-mail",
                  onChanged: controller.client.changeEmail);
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return RaisedButton(
                onPressed: controller.isValid ? () {} : null,
                child: Text("Save"),
              );
            })
          ],
        ),
      );
  }
}