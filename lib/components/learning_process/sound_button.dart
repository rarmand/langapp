import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoundButton extends StatelessWidget {
  // TODO: if clicked, it needs to change a color
  // and add some shadow behind, if its not clicked
  Widget _soundIcon;
  final String audioUrl;
  Function(String) onChooseSoundTap;

  SoundButton({double height = 100.0, @required this.audioUrl, this.onChooseSoundTap}) {
    this._soundIcon = SvgPicture.asset(
      "assets/learning/sound.svg",
      height: height,
    );
  }

  void _playSound() async {
    AudioPlayer audioPlayer = AudioPlayer();
    int result = await audioPlayer.play(this.audioUrl);
    if (result == 1) {}
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: this._soundIcon,
        ),
        onTap: () {
          if (this.onChooseSoundTap != null) this.onChooseSoundTap(this.audioUrl);
          this._playSound();
        });
  }
}
