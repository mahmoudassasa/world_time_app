// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/classes/get_data.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoadingPage() async {
    // Call Class AllCountries to use get data function 
    AllCountries fechData = AllCountries(countryName: "Egypt",flag: "egypt.png",link: "Africa/Cairo");
    //  await = wait before get data from the function inside the class
    await fechData.getData();

// Navigator to Home page and delete the stack to improve performance and pass data to second page (Home)
// and get data from class AllCountries by variable fechData using method  getData  and these properties 
    Navigator.pushReplacementNamed(context, '/Home', arguments: {
      "Time":     fechData.timeNow,
      "Location": fechData.timeZone,
      "isDayTime":fechData.isDayTime
    });
  }

// Start the app and get data and send it to home while loading is in progress
  @override
  void initState() {
    super.initState();
    getDataLoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Color.fromARGB(146, 12, 13, 49),
              size: 160.0,
            )
          ],
        ),
      ),
    );
  }
}
