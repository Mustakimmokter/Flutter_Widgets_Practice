import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_practice_one/animations/bloc/animation_bloc.dart';
import 'package:widget_practice_one/animations/bloc/animation_event.dart';
import 'package:widget_practice_one/animations/bloc/animation_state.dart';

import 'animation_widgets/inedx.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CollapseExpandBloc>(
          lazy: false,
          create: (context) => CollapseExpandBloc(),
        ),
      ],
      child: AnimationBody(),
    );
  }
}


class AnimationBody extends StatelessWidget {
   AnimationBody({Key? key}) : super(key: key);

   late CollapseExpandBloc _collapseExpandBloc;

  @override
  Widget build(BuildContext context) {
    _collapseExpandBloc = BlocProvider.of<CollapseExpandBloc>(context);
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 50,bottom: 10),
        itemCount: ListModel.listData().length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              _collapseExpandBloc.add(CollapseExpand());
              print('object');
            },
            child: BlocBuilder<CollapseExpandBloc,CollapseExpandState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                            bottom: Radius.circular(_collapseExpandBloc.isCollapse? 0 : 10),
                          ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                          border: Border(bottom: BorderSide(width: 1,color: Colors.white10))
                      ),
                    ),
                    CustomAnimationContainer(
                      isAnimate: ListModel.listData()[index].isCollapse = _collapseExpandBloc.isCollapse,
                      child: state is ExpandedState ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Mustakim'),
                          Text('01779-504864'),
                        ],
                      ) : SizedBox(),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
