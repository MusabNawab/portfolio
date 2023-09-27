import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/bloc/changecolor_bloc.dart';
import 'package:portfolio/presentation/screens/constants/colors.dart';
import 'package:portfolio/presentation/screens/constants/files.dart';
import 'package:portfolio/presentation/screens/project_screen/widgets/left.dart';
import 'package:portfolio/presentation/screens/project_screen/widgets/right.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key, required this.screenSize});

  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangecolorBloc, ChangecolorState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              decoration: BoxDecoration(
                gradient: state.changed
                    ? RadialGradient(
                        colors: [
                          Colours.themeColor,
                          Theme.of(context).scaffoldBackgroundColor,
                        ],
                        radius: 0.5,
                        center: constraints.maxWidth < 600
                            ? const Alignment(-0.45, -1.05)
                            : const Alignment(-0.45, -1.2),
                      )
                    : null,
              ),
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Projects',
                    style: TextStyle(
                        fontSize: constraints.maxWidth < 600
                            ? screenSize.height * 0.035
                            : screenSize.width * 0.025),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.07,
                  ),
                  LeftWidget(
                    title: 'Stable Diffusion',
                    description: 'Generate Images by text description',
                    url: Assets.stableDiffusion,
                    screenSize: screenSize,
                    imgList: Assets.sdImgList,
                    link: "https://github.com/MusabNawab/stable-diffusion-app",
                  ),
                  SizedBox(
                    height: screenSize.height * 0.07,
                  ),
                  RightWidget(
                    title: 'Expense Tracker',
                    description:
                        'Keep track of your daily expenses upto 4 years',
                    url: Assets.expenseTracker,
                    screenSize: screenSize,
                    imgList: Assets.etImgList,
                    link: "https://github.com/MusabNawab/ExpenseTracker",
                  ),
                  SizedBox(
                    height: screenSize.height * 0.07,
                  ),
                  LeftWidget(
                    title: 'To Do',
                    description: 'A simple To Do app made with hive',
                    url: Assets.todo,
                    screenSize: screenSize,
                    imgList: Assets.tdImgList,
                    link: "https://github.com/MusabNawab/ToDo_flutter",
                  ),
                  SizedBox(
                    height: screenSize.height * 0.07,
                  ),
                  RightWidget(
                    title: 'CookNote',
                    description: 'Find recepies from different countries',
                    url: Assets.cookNote,
                    screenSize: screenSize,
                    imgList: Assets.cnImgList,
                    link: "https://github.com/MusabNawab/CookNote",
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
