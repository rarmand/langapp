import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

// TODO: czy oddzielić jeszcze kod
// TODO: dodać zmienny square, dodawanie tekstu lub obrazka,
// wtedy animacja odjeżdżania ikonki w lewo, i edytowanie, bez żadnych modali
class LearningHelpBox extends StatefulWidget {
  @override
  _LearningHelpBoxState createState() => _LearningHelpBoxState();
}

class _LearningHelpBoxState extends State<LearningHelpBox> {
  void _onChooseHelpText() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Write helper text:"),
            contentPadding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                padding: EdgeInsets.all(16.0),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: BLACK.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(BTN_RADIUS / 2),
                ),
                child: TextFormField(
                  maxLines: 6,
                ),
              ),
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {},
              )
            ],
          );
        });
  }

  void _onChooseHelpImage() async {
    // var image = await ImagePicker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      padding: EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: BLACK.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(BTN_RADIUS / 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            // poprawić tekst, bardzije tłumacząćy o co chodzi
            "Add an image or a text\nto help your memory.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: BLACK.withOpacity(0.4),
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // add image button
              IconButton(
                iconSize: 48.0,
                icon: Icon(
                  Icons.image,
                  color: BLACK.withOpacity(0.4),
                ),
                onPressed: this._onChooseHelpImage,
              ),
              SizedBox(width: 32.0),
              // add text button
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
      ),
    );
  }
}
