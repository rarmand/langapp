import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/sound_button.dart';

class SoundTaskWriteWord extends StatefulWidget {
  final String wordKey;
  final Map word;
  final Function(bool, String) onNext;

  SoundTaskWriteWord({
    @required this.wordKey,
    @required this.word,
    @required this.onNext,
  });

  @override
  _SoundTaskWriteWordState createState() => _SoundTaskWriteWordState();
}

class _SoundTaskWriteWordState extends State<SoundTaskWriteWord> {
  final TextEditingController _controller = TextEditingController();

  void _next() {
    if (this._controller.text == this.widget.word['translation']) {
      this.widget.onNext(true, this.widget.wordKey);
    } else {
      this.widget.onNext(false, this.widget.wordKey);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    this._controller.dispose();
    super.dispose();
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
              SoundButton(audioUrl: this.widget.word['audio_url']),
              const SizedBox(height: 80.0),
              InputField(
                label: "Write the translation",
                controller: this._controller,
              ),
              const SizedBox(height: 80.0),
              ButtonFilledBig(onPressed: this._next),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
