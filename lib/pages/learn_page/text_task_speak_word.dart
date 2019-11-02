import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/styles/colors.dart';
// import 'package:speech_recognition/speech_recognition.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'dart:async';
// import 'package:audio_recorder/audio_recorder.dart';

// const languages = const [
//   const Language('Francais', 'fr_FR'),
//   const Language('English', 'en_US'),
//   const Language('Pусский', 'ru_RU'),
//   const Language('Italiano', 'it_IT'),
//   const Language('Español', 'es_ES'),
// ];

// class Language {
//   final String name;
//   final String code;

//   const Language(this.name, this.code);
// }

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
  // SpeechRecognition _speech;
  // // if platform lets us interact with it
  // bool _speechRecognitionAvailable = false;
  // // if mic listens to us
  // bool _isListening = false;
  // // result text
  // String transcription = '';

  // Language selectedLang = languages[1];

  // FlutterSound flutterSound = new FlutterSound();
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();

    // this.activateSpeechRecognizer();
  }

  void _next(bool goodAnswer) {
    if (!goodAnswer) {
      this.widget.onNext(false, this.widget.wordKey, this.widget.skill);
    } else {
      this.widget.onNext(true, this.widget.wordKey, this.widget.skill);
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // void activateSpeechRecognizer() {
  //   print('_MyAppState.activateSpeechRecognizer... ');
  //   this._speech = SpeechRecognition();

  //   // setup of all handlers
  //   this._speech.setAvailabilityHandler(onSpeechAvailability);
  //   this._speech.setCurrentLocaleHandler(onCurrentLocale);
  //   this._speech.setRecognitionStartedHandler(onRecognitionStarted);
  //   this._speech.setRecognitionResultHandler(onRecognitionResult);
  //   this._speech.setRecognitionCompleteHandler(onRecognitionComplete);

  //   // activate
  //   this._speech.activate().then((res) {
  //     setState(() => _speechRecognitionAvailable = res);
  //   });
  // }

  // void _onMicTap() {
  //   print("_onMicTap");
  //   if (_speechRecognitionAvailable && !_isListening) start();
  // }

  // void _onMicDoubleTap() {
  //   print("_onMicDoubleTap");
  //   print(_isListening);
  //   if (_isListening) stop();
  // }

  void _onMicTap() async {
    // var _recorderSubscription;

    // // wlacz nagrywanie
    // if (!this._isRecording) {
    //   Future<String> result = flutterSound.startRecorder(null);

    //   result.then((path) {
    //     print('startRecorder: $path');

    //     _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
    //       print(_recorderSubscription);

    //       String txt = "xxx";
    //     });
    //   });

    //   setState(() {
    //     this._isRecording = true;
    //   });
    // }
    // // wylacz nagrywanie
    // else {
    //   Future<String> result = flutterSound.stopRecorder();

    //   result.then((value) {
    //     print('stopRecorder: $value');

    //     if (_recorderSubscription != null) {
    //       print(_recorderSubscription);

    //       _recorderSubscription.cancel();
    //       _recorderSubscription = null;
    //     }
    //   });

    //   setState(() {
    //     this._isRecording = false;
    //   });
    // }
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
              // Text(
              //   transcription,
              //   style: TextStyle(fontSize: 22.0),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 24.0),
              Text(
                "Tap on the microphone and test your pronounciation of the word.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0),
              InkWell(
                child: SvgPicture.asset(
                  "assets/learning/microphone.svg",
                  // color: (_isListening ? YELLOW : BROWN_DARK),
                  color: BROWN_DARK,
                  height: 100.0,
                ),
                // onTap: this._onMicTap,
                // onDoubleTap: this._onMicDoubleTap,
                onTap: this._onMicTap,
              ),
              const SizedBox(height: 40.0),
              // to raczej do stacka
              ButtonFilledBig(onPressed: () => this._next(false)),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  // void start() {
  //   print("start ");
  //   print(selectedLang.code);
  //   _speech.listen(locale: selectedLang.code).then((result) => print('_MyAppState.start => result $result'));
  // }

  // void cancel() {
  //   print("cancel");
  //   _speech.cancel().then((result) => setState(() {
  //         _isListening = result;
  //         transcription = "";
  //       }));
  // }

  // void stop() {
  //   print("stop");

  //   _speech.stop().then((result) {
  //     setState(() => _isListening = result);
  //   });
  // }

  // void onSpeechAvailability(bool result) => setState(() => _speechRecognitionAvailable = result);
  // void onCurrentLocale(String locale) {
  //   print('_MyAppState.onCurrentLocale... $locale');
  //   setState(() => selectedLang = languages.firstWhere((l) => l.code == locale));
  // }

  // void onRecognitionStarted() => setState(() => _isListening = true);
  // void onRecognitionResult(String text) => setState(() => transcription = text);
  // void onRecognitionComplete() => setState(() => _isListening = false);
}
