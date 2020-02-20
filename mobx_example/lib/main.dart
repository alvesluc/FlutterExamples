/*  
  Simple state management using MobX, with Provider and GetIt examples.
  To use the Provider, just remove the comments of Provider's instances...
  then comment the GetIt ones. 

  Gerenciamento de estado simples usando MobX, com exemplos de Provider e GetIt.
  Para utilizar o Provider, basta descomentar suas instâncias e comentar as do GetIt.
*/

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_test/controller/controller.dart';
import 'package:mobx_test/screens/home/home.dart';
//import 'package:provider/provider.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<Controller>(Controller());

  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     /*MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
          dispose: (_, controller) => controller.dispose(),
        )
      ],
      child: MaterialApp(*/
      
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        /* ), */
    );
  }
}
