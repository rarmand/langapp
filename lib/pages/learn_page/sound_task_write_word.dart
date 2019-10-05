import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_square.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/sound_button.dart';

class SoundTaskWriteWord extends StatelessWidget {
  final String iconPath;

  SoundTaskWriteWord({Key key, @required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(points: 24500, iconPath: this.iconPath),
              const SizedBox(height: 64.0),
              SoundButton(),
              const SizedBox(height: 64.0),
              InputField(
                label: "Write the translation",
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonSquare(positive: false, onPressed: () {}),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  ButtonSquare(positive: true, onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
