import 'package:bullseye/about.dart';
import 'package:bullseye/buttons/style_button.dart';
import 'package:bullseye/text_styles.dart';
import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({Key? key, required this.totalScore, required this.round, required this.onStartOver}) : super(key: key);

  final int totalScore;
  final int round;
  final VoidCallback onStartOver;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      StyledButton(
          icon: Icons.refresh,
          onPressed: (){onStartOver();}
      ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 32, right: 32.0),
            child: Column(
              children:  [
                Text('Score ', style: LabelTextStyle.bodyText1(context)),
                Text('$totalScore', style: ScoreNumberTextStyle.headLine4(context), ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: Column(
            children:  [
              Text('Round ', style: LabelTextStyle.bodyText1(context),),
              Text('$round', style: ScoreNumberTextStyle.headLine4(context),)
            ],
          ),
        ),

        StyledButton(
          icon: Icons.info,
            onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AboutPage()));
            },
        )
      ],
    );
  }
}
