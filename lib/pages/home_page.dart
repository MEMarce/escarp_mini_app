// import 'package:escarp_app/Widgets/drawer.dart';
// import 'package:escarp_app/share_prefs/preferencias_usuarios.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    setState(() {});
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 41, 74, 1.0),
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color.fromRGBO(16, 216, 200, 1.0)),
        toolbarHeight: size.height * 0.2,
        backgroundColor: Color.fromRGBO(33, 41, 74, 1.0),
        centerTitle: true,
        title: Text(
          'EscArp',
          style: TextStyle(
            fontSize: size.height * 0.12,
            fontFamily: 'Autography',
            fontWeight: FontWeight.w900,
            color: Color.fromRGBO(16, 216, 200, 1.0),
          ),
        ),
      ),
      // drawer: DrawerWidget(),

      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color.fromRGBO(243, 250, 175, 1.0),
              ),
              width: size.width * 0.9,
              height: 5,
            ),
            Expanded(
              child: Container(),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      child: RaisedButton(
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(
                                color: Color.fromRGBO(16, 216, 200, 1.0),
                                width: 7.0,
                              )),
                          color: Color.fromRGBO(33, 41, 74, 1.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(child: Container()),
                              Container(
                                  width: size.height * 0.2,
                                  height: size.height * 0.2,
                                  child: Image.asset('assets/images/info.png')),
                              Expanded(child: Container()),
                              Text('INFO',
                                  style: TextStyle(
                                      fontSize: size.width * 0.07,
                                      color: Color.fromRGBO(243, 250, 175, 1.0),
                                      fontFamily: 'LiquidBloss')),
                              Expanded(child: Container()),
                              // SizedBox(height: size.height * 0.06),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'tutorial');
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
