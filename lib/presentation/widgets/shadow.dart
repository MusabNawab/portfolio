import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/bloc/changecolor_bloc.dart';

class ShadowWidget extends StatelessWidget {
  const ShadowWidget(
      {super.key, required this.widget, required this.shadowRaidus});

  final Widget widget;
  final double shadowRaidus;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangecolorBloc, ChangecolorState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: state.changed
                ? const [
                    BoxShadow(
                      color: Color.fromARGB(255, 198, 0, 63),
                      blurRadius: 10.0,
                      offset: Offset(5, 10),
                      spreadRadius: 0.5,
                    ),
                  ]
                : null,
            borderRadius: BorderRadius.circular(shadowRaidus),
          ),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(shadowRaidus),
            ),
            clipBehavior: Clip.antiAlias,
            child: widget,
          ),
        );
      },
    );
  }
}
