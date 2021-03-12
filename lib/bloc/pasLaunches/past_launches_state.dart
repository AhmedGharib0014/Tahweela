import 'package:equatable/equatable.dart';
import 'package:tahweela/model/launch.dart';

class PastLaunchState extends Equatable {
  @override
  List<Object> get props => [];
}

class PastLaunchInit extends PastLaunchState {}

class PastLaunchLoading extends PastLaunchState {}

class PastLaunchSuccess extends PastLaunchState {
  final List<Launch> pastLaunches;

  PastLaunchSuccess({this.pastLaunches});

  @override
  List<Object> get props => [pastLaunches];
}

class PastLaunchFailure extends PastLaunchState {
  final String error;
  PastLaunchFailure({this.error});
  @override
  List<Object> get props => [error];
}
