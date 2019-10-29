import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/sound_button.dart';
import 'package:langapp/styles/colors.dart';

class SoundTaskWriteWord extends StatefulWidget {
  final String wordKey;
  final Map word;
  final String skill;
  final Function(bool, String, String) onNext;

  SoundTaskWriteWord({
    @required this.wordKey,
    @required this.word,
    @required this.skill,
    @required this.onNext,
  });

  @override
  _SoundTaskWriteWordState createState() => _SoundTaskWriteWordState();
}

class _SoundTaskWriteWordState extends State<SoundTaskWriteWord> {
  final TextEditingController _controller = TextEditingController();
  InputState inputState;

  void _next() async {
    final isCorrect = this._controller.text == this.widget.word['translation'];
    setState(() {
      this.inputState = isCorrect ? InputState.CORRECT : InputState.INCORRECT;
    });

    await Future.delayed(const Duration(milliseconds: 1500));

    if (isCorrect) {
      this.widget.onNext(true, this.widget.wordKey, this.widget.skill);
    } else {
      this.widget.onNext(false, this.widget.wordKey, this.widget.skill);
    }
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isIncorrect = this.inputState == InputState.INCORRECT;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(),
              const SizedBox(height: 24.0),
              SoundButton(audioUrl: this.widget.word['audio_url']),
              const SizedBox(height: 80.0),
              InputField(
                label: "Write the translation",
                controller: this._controller,
                inputState: this.inputState,
              ),
              if (isIncorrect)
                Text(
                  this.widget.word['translation'],
                  textAlign: TextAlign.left,
                  style: TextStyle(color: GREEN_DARK),
                ),
              SizedBox(height: isIncorrect ? 60.0 : 80.0),
              ButtonFilledBig(onPressed: this._next),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
