import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoudspeakerWordButton extends StatelessWidget {
  final Widget soundIcon = SvgPicture.asset(
    "assets/learning/sound.svg",
    height: 80.0,
  );
  final String news;

  LoudspeakerWordButton({Key key, this.news = "unknown"});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: this.soundIcon,
        onTap: () => print(this.news),
      ),
    );
  }
}
