import 'package:flutter/material.dart';

var apiKey = 'fc43991b4dfbf9e4b4db1130469764ce';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

double latitude=0;
double longitude=0;
late String background;
late String littleText;
double tempCelsius=0;
var temperature;
var humidity;
String backG="";
String sunnyDay = "🌞";
String rainyDay = "🌧";
String emoDay="";
