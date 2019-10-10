import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/sound_button.dart';

class SoundTaskWriteWord extends StatelessWidget {
  final Map word;
  final Function(bool) onNext;

  SoundTaskWriteWord({Key key, @required this.word, @required this.onNext}) : super(key: key);

  void next() {
    // logika co sprawdza czy dobrze wykonane
    // i na koncu
    // onNext(false) jak zle zrobione lub onNext(true) jak dobrze
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(),
              const SizedBox(height: 24.0),
              SoundButton(),
              const SizedBox(height: 80.0),
              InputField(
                label: "Write the translation",
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              ButtonFilledBig(onPressed: () {}),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
