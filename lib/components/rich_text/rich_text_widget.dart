import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final List<TextSpan> textLines;

  RichTextWidget({@required this.textLines});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: this.textLines,
      ),
    );
  }
}
