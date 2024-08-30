import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Model {
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-colud_lightning.svg',
        color: Colors.black87,
      );
    }else if(condition < 600){
      return SvgPicture.asset(
        'svg/climacon-colud_snow.svg',
        color: Colors.black87,
      );
    }else if(condition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.black87,
      );
    }else if(condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-colud_sun.svg',
        color: Colors.black87,
      );
    }else{
      return SvgPicture.asset(
        'svg/alert-error.svg',
        color: Colors.black87,
      );
    }
  }
  
  Widget getAirIcon(int index){
    if(index ==1){
      return Image.asset('assets/good.png',width: 37.0,height: 35.0,);
    }else if(index ==2){
      return Image.asset('assets/fair.png',width: 37.0,height: 35.0,);
    }else if(index ==3){
      return Image.asset('assets/moderate.png',width: 37.0,height: 35.0,);
    }else if(index ==4){
      return Image.asset('assets/poor.png',width: 37.0,height: 35.0,);
    }else if(index ==5){
      return Image.asset('assets/bad.png',width: 37.0,height: 35.0,);
    }else{
      return SvgPicture.asset(
        'svg/alert-error.svg',
        color: Colors.black87,
      );
    }
  }

  Widget getAirCondition(int index){
    if(index ==1){
      return Text('"매우좋음"',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),);
    }else if(index ==2){
      return Text('"좋음"',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),);
    }else if(index ==3){
      return Text('"보통"',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),);
    }else if(index ==4){
      return Text('"나쁨"',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),);
    }else if(index ==5){
      return Text('"매우나쁨"',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),);
    }else{
      return Text('"오류"',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold),);
    }
  }
}
