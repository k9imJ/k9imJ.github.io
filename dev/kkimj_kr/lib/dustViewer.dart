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
                            getFaceImage(airData),
                            Text('${airData.data.current.pollution.aqius}', style: TextStyle(fontSize: 40),),
                            Text(getString(airData), style: TextStyle(fontSize: 20),),]
                      ),

                      color: getColor(airData),
                      padding: const EdgeInsets.all(8),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.network('https://airvisual.com/images/${airData.data.current.weather.ic}.png',
                              width: 32, height: 32,),
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

  Color getColor(AirApi result) {
    if (result.data.current.pollution.aqius <= 50)
      {
        return Colors.greenAccent;
      }
    else if(result.data.current.pollution.aqius <= 100)
      {
        return Colors.yellow;
      }

    else if(result.data.current.pollution.aqius <= 150)
    {
      return Colors.orange;
    }
    else
      return Colors.red;
  }

  String getString(AirApi airData) {
    if (airData.data.current.pollution.aqius <= 50)
    {
      return '양호';
    }
    else if(airData.data.current.pollution.aqius <= 100)
    {
      return '보통';
    }

    else if(airData.data.current.pollution.aqius <= 150)
    {
      return '나쁨';
    }
    else
      return '최악';
  }

  getFaceImage(AirApi airData) {
    if (airData.data.current.pollution.aqius <= 50)
    {
      return Image.network('https://www.airvisual.com/assets/aqi/ic-face-green.svg');
    }
    else if(airData.data.current.pollution.aqius <= 100)
    {
      return Image.network('https://www.airvisual.com/assets/aqi/ic-face-yellow.svg');
    }

    else if(airData.data.current.pollution.aqius <= 150)
    {
      return Image.network('https://www.airvisual.com/assets/aqi/ic-face-orange.svg');
    }
    else
      return Image.network('https://www.airvisual.com/assets/aqi/ic-face-red.svg');

  }
}


