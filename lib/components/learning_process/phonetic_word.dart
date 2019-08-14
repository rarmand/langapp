import 'package:flutter/material.dart';

class PhoneticWord extends StatelessWidget {
  final String word;

  PhoneticWord({@required this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0, bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(32.0, 0, 32.0, 0),
              child: Text(
                this.word,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
