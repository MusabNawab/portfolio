import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/logic/bloc/changecolor_bloc.dart';
import 'package:portfolio/presentation/screens/constants/colors.dart';
import 'package:portfolio/presentation/screens/constants/files.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../constants/methods.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key, required this.scrollOffset});

  final double scrollOffset;
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with SingleTickerProviderStateMixin {
  final date = DateTime.now();
  bool isVisible = false;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 50),
      width: screenSize.width,
      height: screenSize.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              children: [
                Text(
                  'Contact Me',
                  style: TextStyle(
                      fontSize: constraints.maxWidth < 600
                          ? screenSize.height * 0.035
                          : screenSize.width * 0.025),
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocBuilder<ChangecolorBloc, ChangecolorState>(
                  builder: (context, state) {
                    final change = state.changed;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              DateFormat.d().format(date),
                              style: TextStyle(
                                fontSize: constraints.maxHeight * 0.05,
                                fontWeight: FontWeight.bold,
                                color: change
                                    ? Colours.themeColor
                                    : Colours.titleColor,
                              ),
                            ),
                            Text(
                              DateFormat.EEEE().format(date),
                              style: TextStyle(
                                fontSize: constraints.maxHeight * 0.02,
                              ),
                            ),
                            Text(
                              '${DateFormat.MMMM().format(date)} - ${DateFormat.y().format(date)}',
                              style: TextStyle(
                                fontSize: constraints.maxHeight * 0.02,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Methods.gotoUrl(
                                        "https://mail.google.com/mail/u/0/#inbox?compose=CllgCJNxNdjnltfVnHxvPcXwzVDmhZQLFRvVgxxrZLlDjZqrZCggKtfFGMPRjgMbhZhzsJwfkkg");
                                  },
                                  icon: Image.asset(
                                    Assets.gmail,
                                    width: screenSize.height * 0.05,
                                    cacheWidth: 72,
                                    cacheHeight: 72,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      await Clipboard.setData(
                                          const ClipboardData(
                                              text:
                                                  "musabnawabshaikh@gmail.com"));
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Email address copied")));
                                      }
                                    },
                                    child: const Text(
                                        "musabnawabshaikh@gmail.com")),
                              ],
                            ),
                            SizedBox(
                              height: screenSize.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Methods.gotoUrl(
                                        "https://github.com/MusabNawab");
                                  },
                                  icon: Image.asset(
                                    Assets.github,
                                    width: screenSize.height * 0.03,
                                    cacheWidth: 36,
                                    cacheHeight: 36,
                                  ),
                                ),
                                SizedBox(
                                  width: screenSize.width * 0.035,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Methods.gotoUrl(
                                        "https://www.linkedin.com/in/musab-shaikh-b48a4624b/");
                                  },
                                  icon: Image.asset(
                                    Assets.linkedin,
                                    width: screenSize.height * 0.035,
                                    cacheWidth: 33,
                                    cacheHeight: 33,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                const Divider(),
                Text(
                  'Thanks For Visiting',
                  style: TextStyle(fontSize: constraints.maxHeight * 0.02),
                ),
              ],
            );
          }
          return Column(
            children: [
              Text(
                'Contact Me',
                style: TextStyle(fontSize: constraints.maxWidth * 0.025),
              ),
              const SizedBox(
                height: 40,
              ),
              BlocBuilder<ChangecolorBloc, ChangecolorState>(
                builder: (context, state) {
                  final change = state.changed;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            DateFormat.d().format(date),
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                              color: change
                                  ? Colours.themeColor
                                  : Colours.titleColor,
                            ),
                          ),
                          Text(
                            DateFormat.EEEE().format(date),
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '${DateFormat.MMMM().format(date)} - ${DateFormat.y().format(date)}',
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: screenSize.width * 0.1,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Methods.gotoUrl(
                                      "https://mail.google.com/mail/u/0/#inbox?compose=CllgCJNxNdjnltfVnHxvPcXwzVDmhZQLFRvVgxxrZLlDjZqrZCggKtfFGMPRjgMbhZhzsJwfkkg");
                                },
                                icon: Image.asset(
                                  Assets.gmail,
                                  width: screenSize.width * 0.05,
                                  cacheWidth: 72,
                                  cacheHeight: 72,
                                ),
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    await Clipboard.setData(const ClipboardData(
                                        text: "musabnawabshaikh@gmail.com"));
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Email address copied")));
                                    }
                                  },
                                  child:
                                      const Text("musabnawabshaikh@gmail.com")),
                            ],
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Methods.gotoUrl(
                                      "https://github.com/MusabNawab");
                                },
                                icon: Image.asset(
                                  Assets.github,
                                  cacheWidth: 36,
                                  cacheHeight: 36,
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.03,
                              ),
                              IconButton(
                                onPressed: () {
                                  Methods.gotoUrl(
                                      "https://www.linkedin.com/in/musab-shaikh-b48a4624b/");
                                },
                                icon: Image.asset(
                                  Assets.linkedin,
                                  cacheWidth: 33,
                                  cacheHeight: 33,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              const Divider(),
              VisibilityDetector(
                key: UniqueKey(),
                onVisibilityChanged: (info) {
                  _controller.forward();
                },
                child: LottieBuilder.network(
                  'https://assets7.lottiefiles.com/packages/lf20_mu4y88.json',
                  width: screenSize.width * 0.1,
                  //repeat: false,
                  controller: _controller,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.015,
              ),
              const Text(
                'Thanks For Visiting',
                style: TextStyle(fontSize: 27),
              ),
            ],
          );
        },
      ),
    );
  }
}
