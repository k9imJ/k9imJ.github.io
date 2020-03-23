import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Container(

        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow:[
                  BoxShadow(color: Colors.white,
                  offset: Offset(3,0),
                  blurRadius: 3,
                  )
                ]
              ),

            width: double.infinity,
            height: 200,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Hello! 안녕하세요.', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 35),),
                Text('김지운입니다.', style: TextStyle(color: Colors.cyan, fontSize: 25) ),
              ],
            )
              ,),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/dust'),
                      child: Text('미세먼지 확인하기',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/schedule'),
                      child: Text('스케줄 확인하기',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/eng'),
                      child: Text('영어 문제 생성기',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/covid19'),
                      child: Text('COVID 19 UPDATES',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/baby'),
                      child: Text('영아원 SNS app',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
