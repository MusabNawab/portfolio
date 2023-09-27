import 'package:flutter/material.dart';
import 'package:portfolio/presentation/screens/aboutscreen/widgets/aboutscreen_mobile.dart';
import 'package:portfolio/presentation/screens/aboutscreen/widgets/aboutscreen_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key, required this.screenSize});

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    if (screenWidth < 600) {
      return SizedBox(
        width: double.infinity,
        child: AboutScreenMobile(
          screenSize: screenSize,
          circularAvatarRadius: screenHeight * 0.08,
          circularAvatarImageRadius: screenHeight * 0.077,
          verticalSpacing: 5,
          name: screenHeight * 0.03,
          degree: screenHeight * 0.02,
          degreeTitle: screenHeight * 0.03,
          animatedTextHeight: screenHeight * 0.015,
        ),
      );
    }
    return AboutScreenWidget(
      screenSize: screenSize,
      circularAvatarRadius: screenWidth * 0.06,
      circularAvatarImageRadius: screenWidth * 0.057,
      horizontalSpacing: screenWidth * 0.05,
      name: screenWidth * 0.04,
      degree: screenWidth * 0.025,
      degreeTitle: screenWidth * 0.04,
      animatedTextHeight: screenWidth * 0.015,
    );
  }
}
