import 'package:kkimj_kr/HelpBaby.dart';
import 'package:kkimj_kr/covid19.dart';
import 'package:kkimj_kr/dustViewer.dart';
import 'package:kkimj_kr/englishProblemMaker.dart';
import 'package:kkimj_kr/homePage.dart';
import 'package:kkimj_kr/models/AirApi.dart';
import 'package:kkimj_kr/scheduleManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '김지운 :: web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _routes,
    );
  }
}

final _routes = {
  '/': (BuildContext context) => HomePage(),
  '/dust': (BuildContext context) => DustViewer(),
  '/schedule' : (BuildContext context) => ScheduleManager(),
  '/eng' : (BuildContext context) => EnglishProblemMaker(),
  '/covid19' : (BuildContext context) => Covid19(),
  '/baby': (BuildContext context) => HelpBaby(),
};

