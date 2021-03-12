import 'package:equatable/equatable.dart';
import 'package:tahweela/model/launch.dart';

class NextLaunchState extends Equatable {
  @override
  List<Object> get props => [];
}

class NextLaunchInit extends NextLaunchState {}

class NextLaunchLoading extends NextLaunchState {}

class NextLaunchSuccess extends NextLaunchState {
  final Launch nextLaunch;

  NextLaunchSuccess({this.nextLaunch});

  @override
  List<Object> get props => [nextLaunch];
}

class NextLaunchFailure extends NextLaunchState {
  final String error;
  NextLaunchFailure({this.error});
  @override
  List<Object> get props => [error];
}
