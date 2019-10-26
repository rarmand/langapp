import 'package:flutter/material.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class LearningHelpBox extends StatefulWidget {
  String wordkey;
  String helpText;
  int index;
  final bool toCreateText;

  LearningHelpBox({@required this.wordkey, @required this.helpText, @required this.index, this.toCreateText = false});

  @override
  _LearningHelpBoxState createState() => _LearningHelpBoxState();
}

class _LearningHelpBoxState extends State<LearningHelpBox> {
  TextEditingController controller = TextEditingController();

  void _onChooseHelpText() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Write helper text:"),
            contentPadding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0).copyWith(top: 8),
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 3,
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16.0),
                      padding: EdgeInsets.all(16.0),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: BLACK.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(BTN_RADIUS / 2),
                      ),
                      child: TextField(
                        controller: controller,
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        decoration: InputDecoration(hintText: "Write here..."),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: 32.0),
                      IconButton(
                        icon: Icon(Icons.check),
                        onPressed: this._saveHelpText,
                      )
                    ],
                  )
                ],
              )
            ],
          );
        });
  }

  void _saveHelpText() {
    ScopedModel.of<UserModel>(context, rebuildOnChange: true).addHelpText(
      wordkey: this.widget.wordkey,
      text: controller.text,
    );
    controller.text = "";
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Widget lastOption = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Add text to help your memorize the word.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: BLACK.withOpacity(0.4),
            fontSize: 14.0,
          ),
        ),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              iconSize: 48.0,
              icon: Icon(
                Icons.edit,
                color: BLACK.withOpacity(0.4),
              ),
              onPressed: this._onChooseHelpText,
            ),
          ],
        ),
      ],
    );

    Widget textOption = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.widget.helpText,
          maxLines: 6,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: BLACK,
            fontSize: 18.0,
          ),
        ),
      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: BLACK.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(BTN_RADIUS / 2),
      ),
      child: (this.widget.toCreateText ? lastOption : textOption),
    );
  }
}
