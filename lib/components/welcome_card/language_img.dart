import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class LanguageImg extends StatelessWidget {
  final Widget flag = SvgPicture.asset('assets/flags/germany.svg');

  // TODO: flaga i nazwa jezyka do pobrania w konstruktorze
  // TODO: flagi zmienić do jednakich rozmiarów, żeby nie wywalało się

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 45),
        // TODO: img do wycięcia jako uniwersalny komponent
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 132,
              width: 132,
              decoration: BoxDecoration(
                color: WHITE,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 16.0,
                    color: WHITE,
                  ),
                ],
              ),
            ),
            Transform.scale(
              scale: 1.5,
              child: this.flag,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
