import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class MenuButton extends StatelessWidget {
  final Widget icon;
  final String title;

  MenuButton({@required Widget this.icon, @required String this.title});

  // TODO: zmiana koloru dla buttona, w którym własnie jesteśmy
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
            )
          ],
        ));
  }
}
