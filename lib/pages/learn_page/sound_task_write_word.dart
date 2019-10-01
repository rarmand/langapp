import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/button_filled/button_square.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/learning_process/points_label.dart';

class SoundTaskWriteWord extends StatelessWidget {
  // TODO: if clicked, it needs to change a color
  // and add some shadow behind, if its not clicked
  final Widget soundIcon = SvgPicture.asset(
    "assets/learning/sound.svg",
    height: 100.0,
  );

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
              SizedBox(height: 64.0),
              this.soundIcon,
              SizedBox(height: 64.0),
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
