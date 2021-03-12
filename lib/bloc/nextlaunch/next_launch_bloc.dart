import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahweela/bloc/nextlaunch/next_launch_event.dart';
import 'package:tahweela/bloc/nextlaunch/next_launch_state.dart';
import 'package:tahweela/model/launch.dart';
import 'package:tahweela/repository/launch_repo.dart';
import 'package:tahweela/utils/internetConnectivity.dart';

class NextLaunchBloc extends Bloc<NextLaunchEvent, NextLaunchState> {
  NextLaunchBloc() : super(NextLaunchInit());

  @override
  Stream<NextLaunchState> mapEventToState(NextLaunchEvent event) async* {
    if (event is NextLaunchFetch) {
      yield* fetchNextLaunch();
    }
  }

  Stream<NextLaunchState> fetchNextLaunch() async* {
    yield NextLaunchLoading();
    if (await isInternetConnected()) {
      try {
        Launch launch = await LaunchRepository.fetchNextLaunch();
        yield NextLaunchSuccess(nextLaunch: launch);
      } catch (e) {
        yield NextLaunchFailure(error: e.toString());
      }
    } else {
      yield NextLaunchFailure(error: internetErrorMessage());
    }
  }
}
