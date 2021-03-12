import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahweela/bloc/pasLaunches/past_launches_event.dart';
import 'package:tahweela/bloc/pasLaunches/past_launches_state.dart';
import 'package:tahweela/model/launch.dart';
import 'package:tahweela/repository/launch_repo.dart';
import 'package:tahweela/utils/internetConnectivity.dart';

class PastLaunchBloc extends Bloc<PastLaunchEvent, PastLaunchState> {
  PastLaunchBloc() : super(PastLaunchInit());
  List<Launch> pastLaunches = [];

  @override
  Stream<PastLaunchState> mapEventToState(PastLaunchEvent event) async* {
    if (event is PastLaunchFetch) {
      yield* fetchPastLaunch();
    } else if (event is PastLaunchDisplayAllHistory) {
      yield PastLaunchSuccess(pastLaunches: pastLaunches);
    } else if (event is PastLaunchFilter) {
      yield* filterLaunches(event);
    }
  }

  Stream<PastLaunchState> fetchPastLaunch() async* {
    yield PastLaunchLoading();
    if (await isInternetConnected()) {
      try {
        pastLaunches = await LaunchRepository.fetchPastLaunches();
        yield PastLaunchSuccess(pastLaunches: pastLaunches);
      } catch (e) {
        yield PastLaunchFailure(error: e.toString());
      }
    } else {
      yield PastLaunchFailure(error: internetErrorMessage());
    }
  }

  Stream<PastLaunchState> filterLaunches(PastLaunchFilter event) async* {
    List<Launch> filteredLaunches = [];
    if (event.startDateTime == null || event.endDateTime == null) {
      yield PastLaunchFailure(error: "start and end time should be selected");
      return;
    }

    if (event.startDateTime.isAfter(event.endDateTime)) {
      yield PastLaunchFailure(error: "start time should be before end time");
      return;
    }

    pastLaunches.forEach((element) {
      DateTime currentLaunchDateTime =
          DateTime.fromMillisecondsSinceEpoch(element.dateUnix * 1000);
      if (currentLaunchDateTime.isAfter(event.startDateTime) &&
          currentLaunchDateTime.isBefore(event.endDateTime)) {
        filteredLaunches.add(element);
      }
    });
    yield PastLaunchSuccess(pastLaunches: filteredLaunches);
  }
}
