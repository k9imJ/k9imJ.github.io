import 'package:flutter/material.dart';

class EnglishProblemMaker extends StatefulWidget {
  @override
  _EnglishProblemMakerState createState() => _EnglishProblemMakerState();
}

class _EnglishProblemMakerState extends State<EnglishProblemMaker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child : Text('영어 문제 생성기 입니다.!'),
        ),
      ),
    );
  }
}
