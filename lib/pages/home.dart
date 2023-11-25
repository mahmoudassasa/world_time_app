// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //empty global var to use APIDATA map to Receive data  from Loading page
  Map APIDATA = {};
  @override
  Widget build(BuildContext context) {
    
    
    // Receive data  from Loading page an use IF condition to replace fetched data from Loading page

     APIDATA = APIDATA.isEmpty? ModalRoute.of(context)!.settings.arguments as Map : APIDATA;

// record a value on  (onTimePic) = Map (APIDATA) = Key (isDayTime) with IF condition to switch between picture
    String onTimePic = APIDATA["isDayTime"] ? "day.png" : "night.png";

    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 55, 53, 63),
            image: DecorationImage(
                //use variable (onTimePic) to switch between picture
                image: AssetImage("assets/$onTimePic"),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  //receive data from location page
                  dynamic result =
                      await Navigator.pushNamed(context, '/Location');
                  print(result);
                  setState(() {
                    if (result == null) {
                        APIDATA = {
                      "Time": "...",
                      "Location": "⚠️ Please choose a location",
                      "isDayTime": false
                    };
                    } else {
                        APIDATA = {
                      "Time": result["Time"],
                      "Location": result["Location"],
                      "isDayTime": result["isDayTime"]
                    };
                    }

                  
                  });
                  // Navigator.pushNamed(context, '/Location');
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(146, 90, 104, 223)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                color: Color.fromARGB(111, 0, 0, 0),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      APIDATA["Time"],
                      style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 22),
                    Text(
                      APIDATA["Location"],
                      style: TextStyle(fontSize: 33, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
