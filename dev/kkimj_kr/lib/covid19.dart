import 'package:flutter/material.dart';

class Covid19 extends StatefulWidget {
  @override
  _Covid19State createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: SizedBox(
              height: 200,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('Coronavirus UPDATES', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('COVID-19 live map', style: TextStyle(fontSize: 15, color: Colors.white),),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text('Last updated 03/18/2020 05:01 AM (EST)'),
                Text('WORLDWIDE', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                Container(
                  child: Column(children: <Widget>[
                    Text('Total Confimed'),
                    Text('Total Recovered'),
                  ],),
                ),
                Center(child: Text('MORE ABOUT WORLDWIDE'),)
              ],),
          ),
          UsaMap(),
          UsaTable(),
        ],
      ),
    ));
  }
}

class UsaMap extends StatefulWidget {
  @override
  _UsaMapState createState() => _UsaMapState();
}

class _UsaMapState extends State<UsaMap> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/map_example.jpg'));
  }
}

class UsaTable extends StatefulWidget {
  @override
  _UsaTableState createState() => _UsaTableState();
}

class _UsaTableState extends State<UsaTable> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/table_example.jpg'),);
  }
}

