import 'package:bullseye/prompt/prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp( const BullEyeApp());
}

class BullEyeApp extends StatelessWidget {
  const BullEyeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight]
    );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget> [
       const Prompt(targetValue: 1000),
          TextButton(
              onPressed:(){
                _alertIsVisible = true;
                _showAlert(context);
              },
              child: const Text('Hit Me!',
                style: TextStyle(
                color: Colors.blue,
              ),
              )
          ,)
        ],
      ),
    ),
    );
  }

 void _showAlert(BuildContext context){
    var okButton = TextButton(
        onPressed: (){
          Navigator.pop(context);
          _alertIsVisible = false;
          print('Awesome pressed! $_alertIsVisible');
        },
        child: Text('Awesome!')
    );

    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Hello there!'),
        content: const Text('This is my first pop-up'),
        actions: [
          okButton
        ],
        elevation: 30,
      );
        }
    );
 }
}



