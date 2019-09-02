import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<Widget> items;

  Carousel({@required this.items});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: 360.0,
      viewportFraction: 0.7,
      enlargeCenterPage: true,
      items: this.items,
    );
  }
}
