import 'package:flutter/material.dart';
import 'models/AirApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class DustViewer extends StatefulWidget {
  @override
  _DustViewerState createState() => _DustViewerState();
}

class _DustViewerState extends State<DustViewer> {
  AirApi airData;

  Future<AirApi> fetchData() async {
    var response = await http.get('https://api.airvisual.com/v2/nearest_city?key=d2a60400-44aa-4fea-a7ec-d170c20d38db');

    final decode_result = json.decode(response.body);
    AirApi result = AirApi.fromJson(decode_result);
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData().then( (_airData) {
      setState(() {
        airData = _airData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  airData == null ? Center(child: CircularProgressIndicator(),) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('현재 위치 미세먼지',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 16,),
              Card(
                child: Column(
                  children: <Widget>[
                    Container(

                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('얼굴사진',),
                            Text('${airData.data.current.pollution.aqius}', style: TextStyle(fontSize: 40),),
                            Text('보통', style: TextStyle(fontSize: 20),),]
                      ),

                      color: Colors.yellow,
                      padding: const EdgeInsets.all(8),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('이미지'),
                              SizedBox(width: 16,),
                              Text('${airData.data.current.weather.tp}°C', style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          Text('습도 ${airData.data.current.weather.hu}%'),
                          Text('풍속 ${airData.data.current.weather.ws}m/s'),
                        ],
                      ),
                    ),
                  ],

                ),
              ),
              SizedBox(height: 16,),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: RaisedButton(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                  color: Colors.orange,
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: () {}
                  ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


