import 'package:flutter/material.dart';
import 'package:langapp/components/modals/learning_choice_modal.dart';
import 'package:langapp/styles/colors.dart';

class StopSessionModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        "Do you want to exit the learning process?",
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Your progress will be lost"),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.clear, size: 32.0, color: BROWN_DARK),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 40.0),
                  IconButton(
                    icon: Icon(Icons.check, size: 32.0, color: BROWN_DARK),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false);
                      Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) => LearningChoiceModal(),
                      ));
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
