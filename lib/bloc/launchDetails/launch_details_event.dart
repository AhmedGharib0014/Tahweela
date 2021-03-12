import 'package:equatable/equatable.dart';
import 'package:tahweela/model/launch.dart';

class LaunchDetailsEvent extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LaunchDetailsFetch extends LaunchDetailsEvent {
  final Launch currentLaunch;

  LaunchDetailsFetch({this.currentLaunch});
  @override
  List<Object> get props => [currentLaunch];
}
