import 'package:flutter/material.dart';
import 'package:tahweela/model/launch.dart';
import 'package:tahweela/screens/home.dart';
import 'package:tahweela/screens/launch_details.dart';
import 'package:tahweela/screens/launchs_history.dart';
import 'package:tahweela/utils/constants.dart';

class MRouter {
  static Route<dynamic> generateRoute(RouteSettings sittings) {
    switch (sittings.name) {
      case Constant.HOME:
        return MaterialPageRoute(builder: (_) => Home());
      case Constant.LAUNCH_HISTORY:
        return MaterialPageRoute(builder: (_) => LaunchHistory());
      case Constant.LAUNCH_DEtAIls:
        Launch launch = sittings.arguments as Launch;
        return MaterialPageRoute(
            builder: (_) => LaunchDetails(
                  launch: launch,
                ));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("no screens for that root"),
            ),
          );
        });
    }
  }
}
