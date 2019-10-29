import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:langapp/styles/colors.dart';

AudioPlayer audioPlayer = AudioPlayer();
enum SoundButtonState {
  CORRECT,
  INCORRECT,
  CHOSEN,
}

class SoundButton extends StatelessWidget {
  final double height;
  final String audioUrl;
  final SoundButtonState btnState;
  Function(String) onChooseSoundTap;

  SoundButton({this.height = 100.0, this.btnState, @required this.audioUrl, this.onChooseSoundTap});

  void _playSound() async {
    await audioPlayer.stop();
    audioPlayer.setVolume(1.0);
    int result = await audioPlayer.play(this.audioUrl);
    if (result == 1) {}
  }

  @override
  Widget build(BuildContext context) {
    Color color = (btnState == SoundButtonState.CHOSEN ? BROWN_LIGHT : BROWN_DARK);
    color = (btnState == SoundButtonState.INCORRECT ? Colors.red : color);
    color = (btnState == SoundButtonState.CORRECT ? GREEN_DARK : color);

    print(btnState);

    return InkWell(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "assets/learning/sound.svg",
            height: height,
            color: color,
          ),
        ),
        onTap: () {
          if (this.onChooseSoundTap != null) this.onChooseSoundTap(this.audioUrl);
          this._playSound();
        });
  }
}
