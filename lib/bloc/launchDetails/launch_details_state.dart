import 'package:equatable/equatable.dart';
import 'package:tahweela/model/launch.dart';

class LaunchDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class LaunchDetailsInit extends LaunchDetailsState {}

class LaunchDetailsLoading extends LaunchDetailsState {}

class LaunchDetailsSuccess extends LaunchDetailsState {
  final Launch launch;
  LaunchDetailsSuccess({this.launch});
  @override
  List<Object> get props => [launch];
}

class LaunchDetailsFailure extends LaunchDetailsState {
  final String error;
  LaunchDetailsFailure({this.error});
  @override
  List<Object> get props => [error];
}
