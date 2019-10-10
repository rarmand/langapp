import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_answer_outlined.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/sound_button.dart';
import 'package:langapp/styles/colors.dart';

class SoundTaskChooseWord extends StatelessWidget {
  final Map word;
  final Function(bool) onNext;

  SoundTaskChooseWord({Key key, @required this.word, @required this.onNext}) : super(key: key);

  void next() {
    // logika co sprawdza czy dobrze wykonane
    // i na koncu
    // onNext(false) jak zle zrobione lub onNext(true) jak dobrze
  }

  @override
  Widget build(BuildContext context) {
    List<ButtonAnswerOutlined> answers = [
      ButtonAnswerOutlined(
        btnText: "Text number 1",
        onPressed: () {},
      ),
      ButtonAnswerOutlined(
        btnText: "Text number 2",
        onPressed: () {},
      ),
      ButtonAnswerOutlined(
        btnText: "Text number 3",
        onPressed: () {},
      ),
      ButtonAnswerOutlined(
        btnText: "Text number 4",
        onPressed: () {},
      )
    ];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(),
              const SizedBox(height: 24.0),
              SoundButton(),
              const SizedBox(height: 40.0),
              Column(
                children: answers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
