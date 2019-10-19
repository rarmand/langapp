import 'dart:math';

import 'package:flutter/material.dart';
import 'package:langapp/components/bubble/bubble.dart';

class Bubbles extends StatefulWidget {
  @override
  _BubblesState createState() => _BubblesState();
}

class _BubblesState extends State<Bubbles> with SingleTickerProviderStateMixin {
  AnimationController controller;
  int _count = 3;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedOpacity(
                child: Bubble(
                  title: (this._count - controller.value * this._count + 1).round().toString(),
                  radius: (30 + 30 * controller.value),
                  fontSize: (controller.value * 32.0),
                ),
                duration: Duration(seconds: 1),
                opacity: (min(1, controller.value + 0.2)),
              ),

              const SizedBox(height: 20.0),
              // Bubble(
              //   title: "2",
              //   radius: controller.value * 45.0,
              //   fontSize: controller.value * 28.0,
              // ),
              // const SizedBox(height: 20.0),
              // Bubble(
              //   title: "1",
              //   radius: controller.value * 30.0,
              //   fontSize: controller.value * 22.0,
              // ),
            ],
          ),
        );
      },
    );
  }
}
