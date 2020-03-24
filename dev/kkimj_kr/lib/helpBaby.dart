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
      body: Column(
        children: <Widget>[
              mapGraph(),
          SingleChildScrollView(child:cardFeed()),
        ],
      ),
    );
  }
}

class mapGraph extends StatefulWidget {
  @override
  _mapGraphState createState() => _mapGraphState();
}

class _mapGraphState extends State<mapGraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('map graph'),
    );
  }
}

class cardFeed extends StatefulWidget {
  @override
  _cardFeedState createState() => _cardFeedState();
}

class _cardFeedState extends State<cardFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('map graph'),
    );
  }
}
