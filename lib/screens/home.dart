import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:tahweela/bloc/nextlaunch/next_launch_bloc.dart';
import 'package:tahweela/bloc/nextlaunch/next_launch_event.dart';
import 'package:tahweela/bloc/nextlaunch/next_launch_state.dart';
import 'package:tahweela/utils/constants.dart';
import 'package:tahweela/widgets/failure_widget.dart';
import 'package:tahweela/widgets/loading.dart';
import 'package:tahweela/widgets/text_display.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NextLaunchBloc nextLaunchBloc;

  @override
  void initState() {
    super.initState();
    nextLaunchBloc = NextLaunchBloc()..add(NextLaunchFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: BlocBuilder(
          cubit: nextLaunchBloc,
          builder: (context, state) {
            print(state);
            if (state is NextLaunchLoading)
              return Loading();
            else if (state is NextLaunchFailure)
              return FailureWidget(state.error);
            else if (state is NextLaunchSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextDisplay(text: state.nextLaunch.name),
                  SizedBox(
                    height: 16,
                  ),
                  CountdownTimer(
                    endTime: state.nextLaunch.dateUnix * 1000,
                    widgetBuilder: (_, CurrentRemainingTime time) {
                      if (time == null) {
                        return TextDisplay(
                            text: 'the rocked had been launched');
                      }
                      return TextDisplay(
                          text:
                              'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
                    },
                  ),
                  TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Constant.LAUNCH_HISTORY),
                      child: TextDisplay(text: "continue to launches history"))
                ],
              );
            }
            return Container();
          },
        ),
      )),
    );
  }
}
