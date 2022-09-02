import 'package:http/http.dart' as http;
import 'package:climate1/utilities/constants.dart';
import 'dart:convert';


Future getCityData(String cityName) async{
  http.Response response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey'
  ));
  if (response.statusCode == 200){
    temperature = jsonDecode(response.body)['main']['temp'];
    humidity = jsonDecode(response.body)['main']['humidity'];
  }
}
