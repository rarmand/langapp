import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_answer_outlined.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/sound_button.dart';

class SoundTaskChooseWord extends StatelessWidget {
  final Map word;
  final Function(bool) onNext;

  SoundTaskChooseWord({Key key, @required this.word, @required this.onNext}) : super(key: key);

  void _next(bool goodAnswer) {
    // logika co sprawdza czy dobrze wykonane
    // i na koncu
    // onNext(false) jak zle zrobione lub onNext(true) jak dobrze
    if (!goodAnswer) {
      this.onNext(false);
    } else {
      this.onNext(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ButtonAnswerOutlined> answers = [
      ButtonAnswerOutlined(
        btnText: this.word['text'],
        onPressed: () => this._next(true),
      ),
      ButtonAnswerOutlined(
        btnText: this.word['text'],
        onPressed: () => this._next(false),
      ),
      ButtonAnswerOutlined(
        btnText: this.word['text'],
        onPressed: () => this._next(false),
      ),
      ButtonAnswerOutlined(
        btnText: this.word['text'],
        onPressed: () => this._next(false),
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
              SoundButton(audioUrl: this.word['audio_url']),
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
