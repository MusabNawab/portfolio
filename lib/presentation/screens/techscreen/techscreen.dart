import 'package:flutter/material.dart';
import 'package:portfolio/presentation/screens/constants/files.dart';
import 'package:carousel_slider/carousel_slider.dart';

final tech = [
  {"image": Assets.flutterImg, "name": "Flutter"},
  {"image": Assets.firebaseImg, "name": "Firebase"},
  {"image": Assets.dartImg, "name": "Dart"},
  {"image": Assets.javaImg, "name": "Java"},
  {"image": Assets.springboot, "name": "Spring Boot"},
  {"image": Assets.mysql, "name": "MySQL"},
  {"image": Assets.linux, "name": "Linux"},
  {"image": Assets.cImg, "name": "C"},
  {"image": Assets.pyImg, "name": "Python"},
];

class TechScreen extends StatefulWidget {
  const TechScreen({super.key});

  @override
  State<TechScreen> createState() => _TechScreenState();
}

class _TechScreenState extends State<TechScreen>
    with SingleTickerProviderStateMixin {
  bool isHover = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Technologies',
              style: TextStyle(
                fontSize: constraints.maxWidth < 600
                    ? screenSize.height * 0.035
                    : screenSize.width * 0.025,
              ),
            ),
            Text(
              'I know',
              style: TextStyle(
                fontSize: constraints.maxWidth < 600
                    ? screenSize.height * 0.035
                    : screenSize.width * 0.025,
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.15,
            ),
            SizedBox(
              width: constraints.maxWidth < 600
                  ? screenSize.height / 1.5
                  : screenSize.width,
              child: CarouselSlider(
                items: tech
                    .map(
                      (e) => Column(
                        children: [
                          Image.asset(
                            e["image"]!,
                            height: constraints.maxWidth < 600
                                ? screenSize.height * 0.2
                                : screenSize.width * 0.15,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            e["name"]!,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
