import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class TextTaskWriteWord extends StatefulWidget {
  final String wordKey;
  final Map word;
  final Function(bool) onNext;

  TextTaskWriteWord({Key key, @required this.wordKey, @required this.word, @required this.onNext}) : super(key: key);

  @override
  _TextTaskWriteWordState createState() => _TextTaskWriteWordState();
}

class _TextTaskWriteWordState extends State<TextTaskWriteWord> {
  final TextEditingController _controller = TextEditingController();

  void _next() {
    if (this._controller.text == this.widget.word['text']) {
      ScopedModel.of<UserModel>(context).addGoodAnswer(wordKey: this.widget.wordKey);
      this.widget.onNext(true);
    } else {
      this.widget.onNext(false);
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
              const SizedBox(height: 18.0),
              LearningWord(
                word: this.widget.word['translation'],
                isSoundIcon: false,
                audioUrl: "",
              ),
              const SizedBox(height: 80.0),
              InputField(
                label: "Write the word",
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
