import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class TextTaskSpeakWord extends StatefulWidget {
  final String wordKey;
  final Map word;
  final Function(bool) onNext;

  TextTaskSpeakWord({@required this.wordKey, @required this.word, @required this.onNext});

  @override
  _TextTaskSpeakWordState createState() => _TextTaskSpeakWordState();
}

class _TextTaskSpeakWordState extends State<TextTaskSpeakWord> {
  final Widget microphoneIcon = SvgPicture.asset(
    "assets/learning/microphone.svg",
    color: BROWN_DARK,
    height: 100.0,
  );

  void _next(bool goodAnswer) {
    if (!goodAnswer) {
      this.widget.onNext(false);
    } else {
      ScopedModel.of<UserModel>(context).addGoodAnswer(wordKey: this.widget.wordKey);
      this.widget.onNext(true);
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
              LearningWord(word: this.widget.word['text'], isSoundIcon: false, audioUrl: ''),
              const SizedBox(height: 40.0),
              Text(
                "Tap the microphone icon and record your speaking of the word.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              // Inkwell ? klikalne ? jako ikonka nagrywania

              InkWell(child: this.microphoneIcon, onTap: () => print("hey")),
              const SizedBox(height: 64.0),
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
