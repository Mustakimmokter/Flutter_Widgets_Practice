import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_practice_one/animations/bloc/animation_event.dart';
import 'package:widget_practice_one/animations/bloc/animation_state.dart';

class CollapseExpandBloc extends Bloc<CollapseExpandEvent,CollapseExpandState>{
  CollapseExpandBloc() : super(CollapseState()){
    on(_collapseExpand);
  }

  void _collapseExpand(CollapseExpand event,Emitter<CollapseExpandState> emit)async{
    if(state is CollapseState){
      isCollapse = true;
      emit(ExpandedStateTrue());

      await Future.delayed(Duration(milliseconds: 300),(){ emit(ExpandedState());});

    }else if(state is ExpandedState){
      isCollapse = false;
      emit(CollapseStateTrue());

      await Future.delayed(Duration(milliseconds: 300),(){ emit(CollapseState());});

    }
  }

  bool isCollapse = false;
}