part of 'changecolor_bloc.dart';

class ChangecolorState {
  final bool changed;

  const ChangecolorState(this.changed);
}

class ChangecolorInitial extends ChangecolorState {
  ChangecolorInitial() : super(false);
}
