import 'package:flutter/material.dart';

class HelpBaby extends StatefulWidget {
  @override
  _HelpBabyState createState() => _HelpBabyState();
}

class _HelpBabyState extends State<HelpBaby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(

      ),
      body: Center(child:Text('영아원 SNS MainPAGE입니다.'),),
    );
  }
}
