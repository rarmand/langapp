import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/styles/colors.dart';

class NewWordPage extends StatelessWidget {
  final String courseTitle;
  final Widget soundIcon = SvgPicture.asset("assets/learning/sound.svg");

  NewWordPage({@required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpper(
        title: this.courseTitle,
        isCourseAppBar: true,
        onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
        onClosePressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 72.0, bottom: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    this.soundIcon,
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(8.0, 0, 32.0, 0),
                        child: Text(
                          "my mankhiohihio nnfsisid sdifjsiji",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: GREEN_LIGHT,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
