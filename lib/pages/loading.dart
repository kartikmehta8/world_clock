import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    Uri uri = Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Kolkata');
    Response response = await get(uri);
    Map data = await jsonDecode(response.body);

    String datetime = data['datetime'];
    String offsetHours = data['utc_offset'].substring(1, 3);
    String offsetMinutes = data['utc_offset'].substring(4);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));

    if (kDebugMode) {
      print(now);
    }
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('loading'),
    );
  }
}
