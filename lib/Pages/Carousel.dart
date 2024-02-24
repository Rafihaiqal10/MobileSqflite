import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        // Images for the carousel
        NetworkImage("https://images.pexels.com/photos/9689053/pexels-photo-9689053.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        NetworkImage("https://images.pexels.com/photos/7356375/pexels-photo-7356375.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        NetworkImage("https://images.pexels.com/photos/1377034/pexels-photo-1377034.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        NetworkImage("https://images.pexels.com/photos/4620843/pexels-photo-4620843.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
      ].map((image) {
        return Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
