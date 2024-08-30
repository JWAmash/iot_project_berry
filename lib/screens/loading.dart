import 'package:flutter/material.dart';
import 'package:iot_project_berry/data/location.dart';
import 'package:iot_project_berry/data/network.dart';
import 'package:iot_project_berry/screens/myHome.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = 'cf2c7059313afc2d7dbf789d49aade9d';
const weatherapi='test';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  // void getWeatherAPIUri(String lat,String long){
  //   DateTime now = DateTime.now();
  //   String bsd = '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}'; // '20240814'
  //   String bst = '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}'; // '1433'
  //
  //   String pageNo='1';
  //   String numOfRows='1000';
  //   const String dataType = 'XML';
  //   const String base_date=bsd;
  //   const String base_time=bst;
  //   const String nx=lat;
  //   const String ny=long;
  //   url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=$weatherapi&pageNo=$pageNo&numOfRows=';
  // }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longtitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric',
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apikey');
    var weatherData = await network.getJsonData();
    //var airData = await network.getAirData();
    print('요청한 데이터');
    print(weatherData);
    print('공기질');
    //print(airData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return myHome(
        parseWeatherData: weatherData,
        //parseAirPollution: airData,
      );
    }));
  }

  // void fetchData() async{

  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //
  //     var wind = parsingData['wind']['speed'];
  //     print(wind);
  //
  //     var id = parsingData['id'];
  //     print(id);
  //
  //   }else{
  //     print(response.statusCode);
  //   }
  //   print(response.statusCode);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blue,
          size: 80.0,
        )
      ),
    );
  }
}
