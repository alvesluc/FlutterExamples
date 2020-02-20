import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_test/controller/controller.dart';
import 'package:mobx_test/screens/home/body.dart';
//import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     //final controller = Provider.of<Controller>(context);
     final controller = GetIt.I.get<Controller>();
     
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text(controller.isValid ? "Formulário Validado" : "Formulário não Validado");
          },
        ),
      ),
      body: BodyWidget(),
    );
  }
}
