import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SlidingCarousal extends StatelessWidget {
  const SlidingCarousal({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    bool isMobile = MediaQuery.of(context).size.width < 600;
    List<String> images = [
      'images/special_dinner.JPG',
      'images/amber_night.JPG',
      'images/garden2.JPG',
      'images/back_area.JPG',
      'images/garden1.JPG',
      'images/building_edge.JPG',
      'images/corridor.JPG',
      'images/amber_afternoon.JPG',
    ];

    return CarouselSlider(
      options: CarouselOptions(
          height: isMobile ? 300 : height * 0.8, autoPlay: true),
      items: images.map((e) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(e), fit: BoxFit.fill)),
        );
      }).toList(),
    );
  }
}
