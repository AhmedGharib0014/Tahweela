import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahweela/bloc/launchDetails/launch_details_bloc.dart';
import 'package:tahweela/bloc/launchDetails/launch_details_event.dart';
import 'package:tahweela/bloc/pasLaunches/past_launches_bloc.dart';
import 'package:tahweela/bloc/pasLaunches/past_launches_event.dart';
import 'package:tahweela/bloc/pasLaunches/past_launches_state.dart';
import 'package:tahweela/utils/constants.dart';
import 'package:tahweela/widgets/date_time_text_field.dart';
import 'package:tahweela/widgets/failure_widget.dart';
import 'package:tahweela/widgets/loading.dart';
import 'package:tahweela/widgets/text_display.dart';

class LaunchHistory extends StatefulWidget {
  @override
  _LaunchHistoryState createState() => _LaunchHistoryState();
}

class _LaunchHistoryState extends State<LaunchHistory> {
  PastLaunchBloc pastLaunchBloc;
  DateTime startTime;
  DateTime endTime;

  @override
  void initState() {
    super.initState();
    pastLaunchBloc = PastLaunchBloc()..add(PastLaunchFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: TextDisplay(
          text: "past launches",
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildFilterWidget(),
            Expanded(child: _buildStateWidget()),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessWidget(BuildContext context, PastLaunchSuccess state) {
    return ListView.builder(
        itemCount: state.pastLaunches.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            child: ListTile(
              onTap: () => Navigator.pushNamed(context, Constant.LAUNCH_DEtAIls,
                  arguments: state.pastLaunches[index]),
              title: TextDisplay(text: state.pastLaunches[index].name),
              subtitle: TextDisplay(
                text: state.pastLaunches[index].dateUtc,
              ),
            ),
          );
        });
  }

  _buildFilterWidget() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          MDateTimeField(
            title: "start time",
            onChange: (time) => startTime = time,
          ),
          MDateTimeField(
            title: "end time",
            onChange: (time) => endTime = time,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
            child: Row(
              children: [
                TextButton(
                    style: ButtonStyle(),
                    onPressed: () =>
                        pastLaunchBloc.add(PastLaunchDisplayAllHistory()),
                    child: Text("all past history")),
                Spacer(),
                TextButton(
                  onPressed: () => pastLaunchBloc.add(PastLaunchFilter(
                    startDateTime: startTime,
                    endDateTime: endTime,
                  )),
                  child: Text("filter"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildStateWidget() {
    return BlocBuilder(
        cubit: pastLaunchBloc,
        builder: (context, state) {
          if (state is PastLaunchSuccess) {
            return _buildSuccessWidget(context, state);
          }
          if (state is PastLaunchFailure) return FailureWidget(state.error);
          if (state is PastLaunchLoading) return Loading();
          return Container();
        });
  }
}
