import 'package:escarp_app/pages/home_page.dart';
import 'package:escarp_app/pages/tutorial_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final prefs = new PreferenciasUsuario();

  // await prefs.initPrefs();

  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EscArp',
      theme: ThemeData(fontFamily: 'Sindentosa'),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),

        'tutorial': (BuildContext context) => TutorialPage(),

        // 'botones': (BuildContext context) => BotonesPage(),
      },
    );
  }
}
