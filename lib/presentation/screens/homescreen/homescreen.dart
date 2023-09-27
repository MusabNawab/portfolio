import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/bloc/changecolor_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rive/rive.dart';
import 'package:portfolio/presentation/screens/aboutscreen/aboutscreen.dart';
import 'package:portfolio/presentation/screens/contactscreen/contact.dart';
import 'package:portfolio/presentation/screens/project_screen/projectscreen.dart';
import 'package:portfolio/presentation/screens/techscreen/techscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SMITrigger? _bump;

  late StateMachineController controller;
  late ScrollController scrollController;

  void _onRiveInit(Artboard artboard) {
    controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
    artboard.addController(controller);

    _bump = controller.findInput<bool>('toggle') as SMITrigger;
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => ScrollTransformView(
            children: [
              ScrollTransformItem(
                builder: (scrollOffset) {
                  final offScreenPercentage =
                      min(scrollOffset / screenSize.height, 1.0);
                  return GestureDetector(
                    onTap: () {
                      if (constraints.maxWidth < 600) {
                        return;
                      }
                      context.read<ChangecolorBloc>().add(ChangeColor());
                    },
                    child: SizedBox(
                      height: screenSize.height -
                          (screenSize.height * 0.2 * offScreenPercentage),
                      width: screenSize.width -
                          (screenSize.width * 0.2 * offScreenPercentage),
                      child: RiveAnimation.network(
                        'https://public.rive.app/community/runtime-files/5000-10112-sith-de-mayo.riv',
                        fit: BoxFit.cover,
                        onInit: screenSize.width < 600 ? null : _onRiveInit,
                        alignment: Alignment.center,
                      ),
                    ),
                  );
                },
                offsetBuilder: (scrollOffset) {
                  final offScreenPercentage =
                      min(scrollOffset / screenSize.height, 1.0);
                  final heightShrinkageAmt =
                      screenSize.height * 0.2 * offScreenPercentage;

                  final startMovingImg =
                      scrollOffset >= screenSize.height * 0.8;
                  final onScreenOffset = scrollOffset + heightShrinkageAmt / 2;
                  return Offset(
                      0,
                      !startMovingImg
                          ? onScreenOffset
                          : onScreenOffset -
                              (scrollOffset - screenSize.height * 0.8));
                },
              ),
              ScrollTransformItem(
                builder: (scrollOffset) {
                  return AboutScreen(screenSize: screenSize);
                },
                offsetBuilder: (scrollOffset) => constraints.maxWidth < 600
                    ? Offset(screenSize.width * 0.09, -screenSize.height * 0.7)
                    : Offset(screenSize.width * 0.09, -screenSize.height * 0.8),
              ),
              ScrollTransformItem(
                builder: (scrollOffset) {
                  return ProjectScreen(screenSize: screenSize);
                },
              ),
              ScrollTransformItem(
                builder: (scrollOffset) {
                  return const TechScreen();
                },
              ),
              ScrollTransformItem(
                builder: (scrollOffset) {
                  return ContactScreen(
                    scrollOffset: scrollOffset,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<ChangecolorBloc, ChangecolorState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(state.changed
                    ? Icons.wb_sunny_outlined
                    : Icons.mode_night_outlined),
                Switch(
                  value: state.changed,
                  onChanged: (_) {
                    _bump?.fire();
                    context.read<ChangecolorBloc>().add(ChangeColor());
                  },
                )
              ],
            );
          },
        ));
  }
}
