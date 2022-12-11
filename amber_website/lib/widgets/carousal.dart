import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SlidingCarousal extends StatelessWidget {
  const SlidingCarousal({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    List<String> images = [
      'images/amber_dp.JPG',
      'images/card_background.JPG',
      'images/amber_dp.JPG',
      'images/amber_dp.JPG'
    ];

    return CarouselSlider(
      options: CarouselOptions(height: height * 0.8, autoPlay: true),
      items: images.map((e) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(e), fit: BoxFit.fill)),
        );
      }).toList(),
    );
  }
}
