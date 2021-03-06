import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petvac/app/modules/home/home_module.dart';
import 'package:petvac/app/modules/home/home_page.dart';
import 'package:petvac/app/modules/logon/logon_page.dart';
import 'package:petvac/app/modules/pettipos/pettipos_page.dart';

import 'utils/routes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.home: (context) => HomePage(),
        Routes.petTipos: (context) => PetTiposPage(),

      },
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<Object>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.active){

            FirebaseUser user = snapshot.data;

            if (user == null) {
              // Fazer Logon
              return LogonPage();
            }

            return HomeModule();

          } else {
            // Esperar Conexao
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
              );

          }

          
        }
      ),
    );
  }
}
