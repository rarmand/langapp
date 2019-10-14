import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/styles/colors.dart';

class TextTaskSpeakWord extends StatelessWidget {
  // TODO: if clicked, it needs to change a color
  // and add some shadow behind, if its not clicked
  final Widget microphoneIcon = SvgPicture.asset(
    "assets/learning/microphone.svg",
    color: BROWN_DARK,
    height: 100.0,
  );
  final Map word;
  final Function(bool) onNext;

  TextTaskSpeakWord({Key key, @required this.word, @required this.onNext}) : super(key: key);

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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(),
              const SizedBox(height: 24.0),
              LearningWord(word: this.word['text'], isSoundIcon: false, audioUrl: ''),
              const SizedBox(height: 40.0),
              Text(
                "Tap the microphone icon and record your speaking of the word.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              // Inkwell ? klikalne ? jako ikonka nagrywania

              InkWell(child: this.microphoneIcon, onTap: () => print("hey")),
              const SizedBox(height: 72.0),
              // to raczej do stacka
              ButtonFilledBig(onPressed: () => this._next(false)),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
