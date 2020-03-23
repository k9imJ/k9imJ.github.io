// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:kkimj_kr/models/AirApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:kkimj_kr/main.dart';

import "package:http/http.dart" as http;
import 'dart:convert';


void main() {
  test('http 통신 테스트', () async {
    var response = await http.get('https://api.airvisual.com/v2/nearest_city?key=d2a60400-44aa-4fea-a7ec-d170c20d38db');
    expect(response.statusCode, 200);

    final decode_result = json.decode(response.body);
    AirApi result = AirApi.fromJson(decode_result);

    expect(result.status, 'success');
  }
  );
}
