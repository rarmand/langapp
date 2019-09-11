import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

// TODO: można spróbować przerobić na IconButton albo Icon z label
class VocabularyTypeData extends StatelessWidget {
  Widget icon;
  int number;

  VocabularyTypeData({@required this.number = 0, @required pathIcon}) {
    this.icon = SvgPicture.asset(
      pathIcon,
      color: WHITE,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          icon,
          SizedBox(width: 4.0),
          Text(
            this.number.toString(),
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: WHITE,
            ),
          ),
        ],
      ),
    );
  }
}
