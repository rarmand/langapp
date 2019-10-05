import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoundButton extends StatelessWidget {
  // TODO: if clicked, it needs to change a color
  // and add some shadow behind, if its not clicked
  Widget _soundIcon;

  SoundButton({double height = 100.0}) {
    this._soundIcon = SvgPicture.asset(
      "assets/learning/sound.svg",
      height: height,
    );
  }

  void _playSound() async {
    String url =
        'https://firebasestorage.googleapis.com/v0/b/langapp-760c9.appspot.com/o/jobs_vocabulary%2Fartisan.mp3?alt=media&token=a5affe0c-b96c-42ed-bbc7-8346052a845c';
    AudioPlayer audioPlayer = AudioPlayer();
    int result = await audioPlayer.play(url);
    if (result == 1) {}
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: this._soundIcon,
      ),
      onTap: this._playSound,
    );
  }
}
