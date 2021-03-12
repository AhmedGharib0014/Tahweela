import 'package:equatable/equatable.dart';

class PastLaunchEvent extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}

class PastLaunchFetch extends PastLaunchEvent {}
class PastLaunchFilter extends PastLaunchEvent {
  final DateTime startDateTime;
  final DateTime endDateTime;

  PastLaunchFilter({this.startDateTime, this.endDateTime});
  @override
  List<Object> get props => [startDateTime,endDateTime];
}
class PastLaunchDisplayAllHistory extends PastLaunchEvent {}


