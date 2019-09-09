import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  Widget child;

  Frame({@required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        body: Container(
          child: SingleChildScrollView(
            // TODO: po co to?
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
                maxHeight: double.infinity,
              ),
              child: this.child,
            ),
          ),
        ),
      );
    });
  }
}
