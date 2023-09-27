import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  const ImageList({super.key, required this.images});

  final List images;
  @override
  Widget build(BuildContext context) {
    return DeviceFrame(
        device: Devices.android.samsungGalaxyA50,
        screen: CarouselSlider(
          items: images.map((e) => Image.asset(e)).toList(),
          options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ));
  }
}
