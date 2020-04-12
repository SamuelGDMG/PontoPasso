import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pontopasso/model/registrar_dia.dart';
import 'package:pontopasso/screen/home/home.dart';
import 'package:pontopasso/store/controller.dart';
import 'package:provider/provider.dart';

import 'model/ponto_hive.dart';

void main() {

  Hive.registerAdapter(MeuPontoBaseAdapter());
  Hive.registerAdapter(RegistrarDiaAdapter());

  runApp(Main());  
}


class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Controller(),
      child: MaterialApp(
        navigatorObservers: [routeObserver],
        home: Home(),
      ),
    );
  }
}
