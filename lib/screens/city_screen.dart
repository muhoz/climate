
import 'package:climate1/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:climate1/utilities/constants.dart';
import 'package:climate1/services/networking.dart';

var apiKey = 'fc43991b4dfbf9e4b4db1130469764ce';




class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}



/////city_screen.dart

class _CityScreenState extends State<CityScreen> {
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: null,
                ),
                TextButton(
                  onPressed: () async{
                    print(cityController.text);
                    await getCityData(cityController.text);
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LocationScreen(city: cityController.text,temp: temperature,littleText: littleText,backG: background,emoDay: emoDay,)));
                  },
                  child: const Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
                const SizedBox(height: 3,),
                TextField(
                  cursorColor: Colors.redAccent,
                  style: const TextStyle(color: Colors.white),
                  controller: cityController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.location_city,color: Colors.white,),
                    labelText: "Enter City",
                    labelStyle: const TextStyle(letterSpacing: 3 ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
