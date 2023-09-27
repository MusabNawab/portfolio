import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/bloc/changecolor_bloc.dart';

import '../../../widgets/fade_animation.dart';
import '../../constants/colors.dart';
import '../../constants/files.dart';

class AboutScreenMobile extends StatefulWidget {
  const AboutScreenMobile(
      {super.key,
      required this.screenSize,
      required this.circularAvatarRadius,
      required this.circularAvatarImageRadius,
      required this.verticalSpacing,
      required this.name,
      required this.degree,
      required this.degreeTitle,
      required this.animatedTextHeight});

  final Size screenSize;
  final double circularAvatarRadius;
  final double circularAvatarImageRadius;
  final double verticalSpacing;
  final double name;
  final double degree;
  final double degreeTitle;
  final double animatedTextHeight;

  @override
  State<AboutScreenMobile> createState() => _AboutScreenMobileState();
}

class _AboutScreenMobileState extends State<AboutScreenMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangecolorBloc, ChangecolorState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: widget.circularAvatarRadius,
              backgroundColor:
                  state.changed ? Colours.themeColor : Colors.white,
              child: CircleAvatar(
                radius: widget.circularAvatarImageRadius,
                backgroundImage: const AssetImage(
                  Assets.myImg,
                ),
              ),
            ),
            SizedBox(
              height: widget.verticalSpacing,
            ),
            Column(
              children: [
                FadeAnimate(
                  animationController: _animationController,
                  widget: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'I am',
                            style: TextStyle(fontSize: widget.name)),
                        TextSpan(
                          text: ' Musab Shaikh',
                          style: TextStyle(
                            fontSize: widget.name,
                            fontWeight: FontWeight.w500,
                            color: state.changed
                                ? Colours.themeColor
                                : Colours.titleColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Full Stack Android Developer',
                      textStyle: TextStyle(fontSize: widget.animatedTextHeight),
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  // isRepeatingAnimation: true,
                  // pause: const Duration(milliseconds: 1000),
                ),
              ],
            ),
            SizedBox(height: widget.screenSize.height * 0.05),
            Text(
              'Highest Qualification:',
              style: TextStyle(fontSize: widget.degree),
            ),
            Text(
              'B.E Computer Engineering',
              style: TextStyle(
                fontSize: widget.degreeTitle,
                color: state.changed ? Colours.themeColor : Colours.titleColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
