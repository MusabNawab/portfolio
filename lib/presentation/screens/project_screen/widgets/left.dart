import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/bloc/changecolor_bloc.dart';
import 'package:portfolio/presentation/screens/constants/colors.dart';
import 'package:portfolio/presentation/screens/project_screen/widgets/imagelist.dart';
import 'package:portfolio/presentation/widgets/shadow.dart';
import 'package:portfolio/presentation/screens/project_screen/widgets/gif.dart';
import 'package:portfolio/presentation/widgets/fade_animation.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../constants/methods.dart';

class LeftWidget extends StatefulWidget {
  const LeftWidget({
    super.key,
    required this.title,
    required this.description,
    required this.link,
    required this.url,
    required this.screenSize,
    required this.imgList,
  });

  final String title;
  final String description;
  final String link;
  final String url;
  final Size screenSize;
  final List imgList;
  @override
  State<LeftWidget> createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenSize.width,
      height: widget.screenSize.height,
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(
            children: [
              VisibilityDetector(
                key: UniqueKey(),
                onVisibilityChanged: (info) {
                  _controller.forward();
                },
                child: FadeAnimate(
                  animationController: _controller,
                  widget: Column(
                    children: [
                      BlocBuilder<ChangecolorBloc, ChangecolorState>(
                        builder: (context, state) {
                          return Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: widget.screenSize.height * 0.02,
                              fontWeight: FontWeight.bold,
                              color: state.changed
                                  ? Colours.themeColor
                                  : Colours.titleColor,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: widget.screenSize.height * 0.015,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Methods.gotoUrl(widget.link);
                        },
                        child: Text(
                          "Go to github repository",
                          style: TextStyle(
                            fontSize: widget.screenSize.height * 0.012,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: widget.screenSize.height * 0.05,
              ),
              SizedBox(
                height: widget.screenSize.height * 0.85,
                child: ShadowWidget(
                  widget: ImageList(images: widget.imgList),
                  shadowRaidus: 40,
                ),
              ),
            ],
          );
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: widget.screenSize.width * 0.07,
              child: SizedBox(
                height: widget.screenSize.height * 0.85,
                child: ShadowWidget(
                  widget: Giif(assetName: widget.url),
                  shadowRaidus: 42,
                ),
              ),
            ),
            Positioned(
              top: widget.screenSize.height * 0.2,
              right: widget.screenSize.width > 600 &&
                      widget.screenSize.width < 1000
                  ? widget.screenSize.height * 0.5
                  : widget.screenSize.width * 0.35,
              child: VisibilityDetector(
                key: UniqueKey(),
                onVisibilityChanged: (info) {
                  _controller.forward();
                },
                child: FadeAnimate(
                  animationController: _controller,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<ChangecolorBloc, ChangecolorState>(
                        builder: (context, state) {
                          return Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: widget.screenSize.width * 0.02,
                              fontWeight: FontWeight.bold,
                              color: state.changed
                                  ? Colours.themeColor
                                  : Colours.titleColor,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: widget.screenSize.width * 0.011,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Methods.gotoUrl(widget.link);
                        },
                        child: Text(
                          "Go to github repository",
                          style: TextStyle(
                            fontSize: widget.screenSize.width * 0.008,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
