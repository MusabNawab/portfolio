import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/bloc/changecolor_bloc.dart';
import 'package:portfolio/presentation/screens/constants/colors.dart';
import 'package:portfolio/presentation/screens/homescreen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

bool toggle = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChangecolorBloc(),
        child: BlocBuilder<ChangecolorBloc, ChangecolorState>(
          builder: (context, state) {
            return Builder(
              builder: (context) => MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    brightness: Brightness.dark,
                    seedColor:
                        state.changed ? Colours.themeColor : Colours.titleColor,
                  ),
                  useMaterial3: true,
                  brightness: Brightness.dark,
                  scaffoldBackgroundColor:
                      state.changed ? Colours.bgColor1 : Colours.bgColor2,
                ),
                home: const HomeScreen(),
                debugShowCheckedModeBanner: false,
              ),
            );
          },
        ));
  }
}
