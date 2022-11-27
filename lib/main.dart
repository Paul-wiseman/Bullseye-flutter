import 'package:bullseye/control/control.dart';
import 'package:bullseye/game_model.dart';
import 'package:bullseye/score.dart';
import 'package:bullseye/prompt/prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const BullEyeApp());
}

class BullEyeApp extends StatelessWidget {
  const BullEyeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return const MaterialApp(
      title: 'Bullseye',
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var _alertIsVisible = false;
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Prompt(targetValue: 1000),
             Control(model: _model),
            TextButton(
              onPressed: () {
                _alertIsVisible = true;
                _showAlert(context);
              },
              child: const Text(
                'Hit Me!',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
             Score(
                totalScore: _model.totalScore,
                 round: _model.round)
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    var okButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          _alertIsVisible = false;
          print('Awesome pressed! $_alertIsVisible');
        },
        child: Text('Awesome!'));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Hello there!'),
            content: Text('The slider\'s value is ${_model.current}'),
            actions: [okButton],
            elevation: 30,
          );
        });
  }
}
