import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:speech_recognition/speech_recognition.dart';

const Map languages = const {
  'german': 'de_DE',
  'french': 'fr_FR',
};

class TextTaskSpeakWord extends StatefulWidget {
  final String wordKey;
  final Map word;
  final String skill;
  final Function(bool, String, String) onNext;

  TextTaskSpeakWord({@required this.wordKey, @required this.word, @required this.skill, @required this.onNext});

  @override
  _TextTaskSpeakWordState createState() => _TextTaskSpeakWordState();
}

class _TextTaskSpeakWordState extends State<TextTaskSpeakWord> {
  SpeechRecognition _speech;
  // // if mic listens to us
  bool _isListening = false;
  // // result text
  String transcription = '';
  // // if platform lets us interact with it
  bool _speechRecognitionAvailable = false;

  String _locale = "";

  @override
  void initState() {
    super.initState();
    final lang = ScopedModel.of<UserModel>(context).chosenCourse['language'];
    // debugPrint(lang + ' jenzyk kursy kturego sie uczysz');

    this._locale = languages[lang];
    print(this._locale);

    this.activateSpeechRecognizer();
  }

  void _next(bool goodAnswer) async {
    if (this.transcription.isEmpty) return;

    if (!goodAnswer) {
      this.widget.onNext(false, this.widget.wordKey, this.widget.skill);
    } else {
      this.widget.onNext(true, this.widget.wordKey, this.widget.skill);
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    this._speech = SpeechRecognition();

    // setup of all handlers
    this._speech.setAvailabilityHandler(onSpeechAvailability);
    this._speech.setRecognitionStartedHandler(onRecognitionStarted);
    this._speech.setRecognitionResultHandler(onRecognitionResult);
    this._speech.setRecognitionCompleteHandler(onRecognitionComplete);
    this._speech.setErrorHandler(() {
      // debugPrint('cos nie tak');
      setState(() {
        _isListening = false;
      });
    });

    // activate
    this._speech.activate();
  }

  void _onMicTap() {
    // print("_onMicTap");
    
    _speech.listen(locale: this._locale).then((value) {
      // debugPrint('result: ' + value.toString());
      setState(() {
        _isListening = value;
      });
    }).catchError((e) {
      debugPrint('error ' + e);
    });
  }

  @override
  void dispose() {
    this._speech.cancel();
    super.dispose();
  }

  void _onButtonPressed() {
    if (this.widget.word['text'].toString().toLowerCase() == this.transcription) {
      this._next(true);
    } else {
      this._next(false);
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
              const SizedBox(height: 24.0),
              (this.transcription.isEmpty
                  ? SizedBox(height: 24.0)
                  : Text(
                      transcription,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: (this.widget.word['text'].toString().toLowerCase() == this.transcription
                            ? GREEN_LIGHT
                            : Colors.red),
                      ),
                      textAlign: TextAlign.center,
                    )),
              const SizedBox(height: 24.0),
              Text(
                "Tap on the microphone and test your pronounciation of the word.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0),
              InkWell(
                child: SvgPicture.asset(
                  "assets/learning/microphone.svg",
                  color: (_isListening ? YELLOW : BROWN_DARK),
                  height: 100.0,
                ),
                onTap: this._onMicTap,
              ),
              const SizedBox(height: 40.0),
              // to raczej do stacka
              ButtonFilledBig(onPressed: this._onButtonPressed),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  void onSpeechAvailability(bool result) => setState(() => _speechRecognitionAvailable = result);
  // void onCurrentLocale(String locale) {
  //   print('_MyAppState.onCurrentLocale... $locale');
  //   setState(() => selectedLang = languages.firstWhere((l) => l.code == locale));
  // }

  void onRecognitionStarted() {
    debugPrint('reconginition started');
    setState(() => _isListening = true);
  }

  void onRecognitionResult(String text) {
    debugPrint(text + ' lalalalalalal');
    setState(() => transcription = text);
  }

  void onRecognitionComplete(String text) {
    debugPrint('recognition complete - ' + text);
    setState(() => _isListening = false);
  }
}
