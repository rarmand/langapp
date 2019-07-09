import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class MenuButton extends StatelessWidget {
  final String iconPath;
  final String title;
  Widget icon;
  final bool chosen;

  MenuButton({@required this.iconPath, @required this.title, this.chosen = false}) {
    icon = (chosen
        ? SvgPicture.asset(iconPath, color: YELLOW)
        : SvgPicture.asset(
            iconPath,
          ));
  }
  //TODO: zmniejszyć ikonki

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
                child: Container(
                  child: Transform.scale(
                    child: icon,
                    scale: 0.75,
                  ),
                ),
                onTap: () {
                  print("click icon");
                }),
            Text(
              this.title,
              style: (chosen ? TextStyle(color: YELLOW) : TextStyle()),
            )
          ],
        ));
  }
}
