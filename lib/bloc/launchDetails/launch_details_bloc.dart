import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahweela/bloc/launchDetails/launch_details_event.dart';
import 'package:tahweela/bloc/launchDetails/launch_details_state.dart';
import 'package:tahweela/model/launch.dart';
import 'package:tahweela/repository/launch_repo.dart';
import 'package:tahweela/utils/internetConnectivity.dart';

class LaunchDetailsBloc extends Bloc<LaunchDetailsEvent, LaunchDetailsState> {
  LaunchDetailsBloc() : super(LaunchDetailsInit());

  @override
  Stream<LaunchDetailsState> mapEventToState(LaunchDetailsEvent event) async* {
    if (event is LaunchDetailsFetch) {
      yield* fetchLaunchDetails(event);
    }
  }

  Stream<LaunchDetailsState> fetchLaunchDetails(
      LaunchDetailsFetch event) async* {
    yield LaunchDetailsLoading();
    if (await isInternetConnected()) {
      try {
        Launch updatedLaunch =
            await LaunchRepository.fetchLaunchDetails(event.currentLaunch);
        yield LaunchDetailsSuccess(launch: updatedLaunch);
      } catch (e) {
        yield LaunchDetailsFailure(error: e.toString());
      }
    } else {
      yield LaunchDetailsFailure(error: internetErrorMessage());
    }
  }
}
