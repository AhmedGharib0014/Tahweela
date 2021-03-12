import 'dart:convert';
import 'package:tahweela/model/launch_pad.dart';
import 'package:tahweela/model/payload.dart';
import 'package:tahweela/model/rocket.dart';
import 'package:tahweela/utils/config.dart';
import 'package:tahweela/model/launch.dart';
import 'package:http/http.dart' as http;
import 'package:tahweela/utils/api_paths.dart';

class LaunchRepository {
  static Future<Launch> fetchNextLaunch() async {
    var response = await http.get("${BASE_URL()}${ApiPaths.NEXT_LAUNCH}");
    if (response.statusCode == 200) {
      return Launch.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  static Future<List<Launch>> fetchPastLaunches() async {
    var response = await http.get("${BASE_URL()}${ApiPaths.PAST_LAUNCHES}");
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => Launch.fromJson(e))
          .toList();
    } else {
      return null;
    }
  }

  static Future<Launch> fetchLaunchDetails(Launch currentLaunch) async {
    List<http.Response> list = await Future.wait([
      http.get("${BASE_URL()}${ApiPaths.LAUNCH_ROCKET}${currentLaunch.rocket}"),
      http.get("${BASE_URL()}${ApiPaths.LAUNCH_PAD}${currentLaunch.launchpad}"),
      http.get("${BASE_URL()}${ApiPaths.PAYLOUDS}${currentLaunch.payloads[0]}"),
    ]);
    list.asMap().forEach((key, value) {
      if (value.statusCode == 200) {
        switch (key) {
          case 0:
            currentLaunch.currentRocket =
                Rocket.fromJson(jsonDecode(value.body));
            break;
          case 1:
            currentLaunch.currentLaunchPad =
                LaunchPad.fromJson(jsonDecode(value.body));
            break;
          case 2:
            currentLaunch.currentPayLoad =
                PayLoad.fromJson(jsonDecode(value.body));
            break;
          default:
        }
      }
    });
    return currentLaunch;
  }
}
