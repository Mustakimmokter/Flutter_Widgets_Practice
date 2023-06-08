import 'package:equatable/equatable.dart';

abstract class CollapseExpandState extends Equatable {}

class CollapseExpandInitialState extends CollapseExpandState {
  @override
  List<Object?> get props =>  [];
}

class CollapseStateTrue extends CollapseExpandState {
  @override
  List<Object?> get props => [];
}
class CollapseState extends CollapseExpandState {
  @override
  List<Object?> get props => [];
}

class ExpandedState extends CollapseExpandState {
  @override
  List<Object?> get props => [];
}
class ExpandedStateTrue extends CollapseExpandState {
  @override
  List<Object?> get props => [];
}