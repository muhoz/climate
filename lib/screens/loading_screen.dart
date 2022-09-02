import 'package:climate1/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:climate1/services/location.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'dart:io';

import '../utilities/constants.dart';


///////loading_screen.dart


void showDialoga(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          title: Text(
            "Pas de connexion internet détectée sur votre mobile",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          content: Text(
            "Veuillez activer la connexion internet sur votre mobile ou vous-connectez à un point d'accès wifi",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shadowColor: Colors.pinkAccent,
                primary: Colors.pink,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                //Navigator.pop(context);
                SystemNavigator.pop();
              },
              child: Text(
                "Okay",
              ),
            )
          ],
        );
      }
  );}

void showDialogaa(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          title: Text(
            "Problème de connexion à l'api",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          content: Text(
            "Nous n'arrivons pas à récupérer les infos de la BD.Veuillez réessayer plus tard",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shadowColor: Colors.pinkAccent,
                primary: Colors.pink,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Okay",
              ),
            )
          ],
        );
      }
  );}

Future ConnectivityTest(BuildContext context) async{
  bool result = await DataConnectionChecker().hasConnection;
  if(result == true) {
    InternetTest(context);
  } else {
    print('No internet :( Reason:');
    print(DataConnectionChecker().lastTryResults);
    showDialoga(context);
  }
}

Future InternetTest(BuildContext context) async{
  try {
    final result1 = await InternetAddress.lookup('google.com');
    if (result1.isNotEmpty && result1[0].rawAddress.isNotEmpty) {

    }
  } on SocketException catch (_) {
    showDialogaa(context);
  }
}




class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    ConnectivityTest(context);
    getPosition();
    super.initState();
  }

  void getPosition() async {
    Positioning v = Positioning();
    await v.getCurrentPosition();
    latitude = 3.8381993;
    longitude = 11.4907126;
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
    if (response.statusCode == 200) {
      var temperature = jsonDecode(response.body)['main']['temp'];
      var city = jsonDecode(response.body)['name'];
      tempCelsius = temperature - 273.15;
      if(tempCelsius<25){
        background = 'images/animepluie.gif';
        littleText = "Think to cover yourself, risk of ☔ in ";
        emoDay = rainyDay;
      }else{
        background = 'images/sunnydaygif.gif';
        littleText = "Clear sky, it's 🍦 time in ";
        emoDay = sunnyDay;
      }
      Future.delayed(const Duration(
          seconds: 3
      ));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LocationScreen(city: city,temp:temperature,backG: background,littleText: littleText,emoDay: emoDay,)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    );
  }
}
