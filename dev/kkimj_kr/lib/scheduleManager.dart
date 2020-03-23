import 'package:flutter/material.dart';

class ScheduleManager extends StatefulWidget {
  @override
  _ScheduleManagerState createState() => _ScheduleManagerState();
}

class _ScheduleManagerState extends State<ScheduleManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Text('스케줄 관리 화면입니다.!'),
        ),
      ),
    );
  }
}
