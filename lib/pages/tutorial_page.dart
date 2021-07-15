import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
// import 'package:escarp_app/share_prefs/preferencias_usuarios.dart';

class TutorialPage extends StatefulWidget {
  final String nombre;
  // TutorialPage({Key key}) : super(key: key);
  TutorialPage({this.nombre});

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  // final prefs = new PreferenciasUsuario();
  VideoPlayerController _controller;

  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Crear y almacenar el VideoPlayerController. El VideoPlayerController
    // ofrece distintos constructores diferentes para reproducir videos desde assets, archivos,
    // o internet.
    _controller = VideoPlayerController.asset(
      'assets/videos/tutorial_espanol.mp4',
    );

    // Inicializa el controlador y almacena el Future para utilizarlo luego
    _initializeVideoPlayerFuture = _controller.initialize();

    // Usa el controlador para hacer un bucle en el vídeo

    _controller.setLooping(true);
    _controller.play();

    super.initState();
  }

  @override
  void dispose() {
    // Asegúrate de despachar el VideoPlayerController para liberar los recursos
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(33, 41, 74, 1.0),
        body: Center(child: _videoTutorial()),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Container(
          width: size.height * 0.1,
          height: size.height * 0.1,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_backspace_rounded,
              color: Color.fromRGBO(16, 216, 200, 1.0),
              size: size.height * 0.1,
            ),
          ),
        ));
  }

  // ignore: missing_return
  Widget _videoTutorial() {
    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.bottomCenter,
      height: size.height * 0.95,
      width: size.width * 0.95,
      child: Row(
        children: <Widget>[
          Expanded(child: Container()),
          Container(
            height: size.height * 0.75,
            width: size.width * 0.75,
            child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // Si el VideoPlayerController ha finalizado la inicialización, usa
                    // los datos que proporciona para limitar la relación de aspecto del VideoPlayer
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Usa el Widget VideoPlayer para mostrar el vídeo
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    // Si el VideoPlayerController todavía se está inicializando, muestra un
                    // spinner de carga
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
                onPressed: () {
                  // Envuelve la reproducción o pausa en una llamada a `setState`. Esto asegura
                  // que se muestra el icono correcto
                  setState(() {
                    // Si el vídeo se está reproduciendo, pausalo.
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      // Si el vídeo está pausado, reprodúcelo
                      _controller.play();
                    }
                  });
                },
                // Muestra el icono correcto dependiendo del estado del vídeo.
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                )),
          )),

          // ignore: dead_code
        ],
      ),
    );
  }
}
