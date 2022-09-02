import 'package:climate1/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:climate1/utilities/constants.dart';

import 'About.dart';


//////location_screen.dart


class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
  String city;
  double temp;
  String backG;
  String littleText;
  String emoDay;
  LocationScreen({Key? key, this.city = "", this.temp = 0,this.backG="",this.littleText="",this.emoDay=""}) : super(key: key);
}


class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.backG),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => About()));
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CityScreen()));
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${widget.temp - 273.15}'.substring(0, 2),
                      style: kTempTextStyle,
                    ),
                    const Text(
                      '°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      "${widget.emoDay}",
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0,bottom: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right:15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${widget.littleText}${widget.city}!",
                            textAlign: TextAlign.left,
                            style: (kMessageTextStyle),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
