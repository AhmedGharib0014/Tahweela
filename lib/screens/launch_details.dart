import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahweela/bloc/launchDetails/launch_details_bloc.dart';
import 'package:tahweela/bloc/launchDetails/launch_details_event.dart';
import 'package:tahweela/bloc/launchDetails/launch_details_state.dart';
import 'package:tahweela/model/launch.dart';
import 'package:tahweela/widgets/failure_widget.dart';
import 'package:tahweela/widgets/loading.dart';
import 'package:tahweela/widgets/text_display.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchDetails extends StatefulWidget {
  final Launch launch;
  LaunchDetails({this.launch});

  @override
  _LaunchDetailsState createState() => _LaunchDetailsState();
}

class _LaunchDetailsState extends State<LaunchDetails> {
  LaunchDetailsBloc _launchDetailsBloc;

  @override
  void initState() {
    super.initState();
    _launchDetailsBloc = LaunchDetailsBloc();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _launchDetailsBloc.add(LaunchDetailsFetch(currentLaunch: widget.launch));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextDisplay(
          text: "launch details",
        ),
      ),
      body: SafeArea(
        child: BlocBuilder(
            cubit: _launchDetailsBloc,
            builder: (context, state) {
              if (state is LaunchDetailsLoading) return Loading();
              if (state is LaunchDetailsFailure)
                return FailureWidget(state.error);
              if (state is LaunchDetailsSuccess)
                return _buildSuccessWidget(state);
              return Container();
            }),
      ),
    );
  }

  Widget _buildSuccessWidget(LaunchDetailsSuccess state) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildInfoTile("launch name", state.launch.name),
        _buildInfoTile("launch date", state.launch.dateUtc),
        _buildInfoTile("rocket name", state.launch.currentRocket.name),
        _buildInfoTile("launch pad name", state.launch.currentLaunchPad.name),
        _buildInfoTile("launch payload name", state.launch.currentPayLoad.name),
        RaisedButton(
          onPressed: () async {
            await launch(state.launch.links.webcast);
          },
          child: TextDisplay(
            text: "display video",
          ),
        )
      ],
    );
  }

  _buildInfoTile(String title, String subTitle) {
    return ListTile(
      title: TextDisplay(
        text: title,
      ),
      subtitle: TextDisplay(
        text: subTitle,
      ),
    );
  }
}
