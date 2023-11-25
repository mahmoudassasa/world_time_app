import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AllCountries {


  // properties or  variabke for pass to list to create a list of countries
  final String flag; //country flag 
  final String countryName; //country Name
  final String link; //country time zone link  (Africa/Cairo) like that , uses after / and used as variable
  //useed to call this class and pass this variables  
  AllCountries({required this.flag , required this.countryName , required this.link });

//pice of list located in location page
// AllCountries(
//         link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png'),


//properties

  // properties or  variabke  isDayTime = no value but value will defined  later
  late bool isDayTime;
  // properties or  variabke  timeNow = no value but value will defined  later
  late String timeNow;
  // properties or  variabke  timeZone = no value but value will defined  later
  late String timeZone;

// method to use in many pages
  getData() async {
// wait data before get it from API
    Response receivedDataFromAPI = await get(
// get data from API
        Uri.parse('http://worldtimeapi.org/api/timezone/$link'));
    Map receivedData = jsonDecode(receivedDataFromAPI.body);
// convert String dateTime to type (DateTime)
/////////////// String dateTime = receivedData["utc_datetime"];/////////////// shorted code///////
    DateTime dateTime = DateTime.parse(receivedData["utc_datetime"]);
/////////// DateTime realTime = DateTime.parse(dateTime);////////////////////shorted code////////
// convert String offset to type (int) and Take first 3 num to convert it to type (int)
    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));
// convert String offset to type (int)
////////////////// int iOffset = int.parse(offset);/////////////////////////shorted code////////

// get time Duration and add the Duration(offset +2)
    DateTime realTime = dateTime.add(Duration(hours: offset));
// if time > 5 (Greater-than) OR (|| = or mark && = and) and time > 18
    if (realTime.hour > 5 && realTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

//date format (09:46 AM) = time now = (realTime)
// Data type (String) and variable = date format (09:46 AM) = time now = (realTime)
    timeNow = DateFormat('hh:mm a').format(realTime);

// Data type (String) and variable = receivedData (Map) to get time zone
    timeZone = receivedData["timezone"];
  }
}
