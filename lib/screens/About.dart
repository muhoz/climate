import 'package:flutter/material.dart';

import 'city_screen.dart';


//////About.dart

class About extends StatelessWidget {

  Color greyColor = Color(0xFFF7F7F7);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("CLIMATE",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold,letterSpacing: 7,color: Colors.white.withAlpha(255),fontFamily: 'Spartan MB'),),
              SizedBox(height:30),
              Text("Version 1.0",style: TextStyle(fontSize: 25,letterSpacing: 5,color: Colors.white.withAlpha(155),fontFamily: 'Spartan MB')),
              SizedBox(height:30),
              Text("Copyright @Muho",style: TextStyle(fontSize: 20,letterSpacing: 3,fontFamily: 'Spartan MB',color: Colors.white.withAlpha(55))),
              SizedBox(height: 50,),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black12),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>CityScreen()));
                      },
                      icon: Icon(Icons.keyboard_arrow_left,size:30,color: Colors.white,))),
            ],
          ),
        ),
      ),
    );
  }
}
