// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:world_time_app/classes/get_data.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  //list of data includes countries data: timezones link , countries name , contries flag. 
  List<AllCountries> allCountries = [
    AllCountries(
        link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png'),
    AllCountries(
        link: 'Africa/Tunis',
        countryName: 'Tunisia - Tunis',
        flag: 'tunisia.png'),
    AllCountries(
        link: 'Africa/Algiers',
        countryName: 'Algeria - Algiers',
        flag: 'algeria.png'),
    AllCountries(
        link: 'Australia/Sydney',
        countryName: 'Australia - Sydney',
        flag: 'australia.png'),
    AllCountries(
        link: 'America/Toronto',
        countryName: 'Canada - Toronto',
        flag: 'canada.png'),
    AllCountries(
        link: 'Asia/Riyadh',
        countryName: '	Saudi Arabia - Riyadh',
        flag: 'sa.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 191, 199),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(
          "Choose Location",
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Color.fromARGB(146, 12, 16, 49),
      ),
      body: SizedBox(
          child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: allCountries.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    onTap: () async {
                      // Call Class AllCountries to use get data function and use var allCountries (List) to 
                      //get data when you click on any country , use index to select items from list (allCountries) by index 
                      AllCountries onClickedCountry = allCountries[index];
                      //  await = wait before get data from the function inside the class
                      await onClickedCountry.getData();

                      //send this data to Home page
                      Navigator.pop(context, {
                        "Time": onClickedCountry.timeNow,
                        "Location": onClickedCountry.timeZone,
                        "isDayTime": onClickedCountry.isDayTime
                      });
                    },
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/${allCountries[index].flag}"),
                    ),
                    title: Text(
                      allCountries[index].countryName,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                );
              })),
    );
  }
}
