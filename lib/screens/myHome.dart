import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ScreenA.dart';
import 'ScreenB.dart';
import 'package:iot_project_berry/model/model.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class myHome extends StatefulWidget {
  final dynamic parseWeatherData;

  myHome({this.parseWeatherData});

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  Model model = Model();
  String? airState;
  int? temp;
  var date = DateTime.now().toLocal();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('작동?');
    print('날짜형식');

    print(date);
  }

  void updateData(dynamic weatherData) {
    // double temp = weatherData[];
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
                  print('설정 버튼 클릭');
                },
                icon: Icon(Icons.search))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.teal[200],
                      backgroundImage: AssetImage('assets/Icon1.jpg')),
                  accountName: Text('좌승혁'),
                  accountEmail: Text('test@naver.com')),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.grey[850],
                ),
                title: Text('home'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ScreenA()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey[850],
                ),
                title: Text('setting'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ScreenB()));
                },
              )
            ],
          ),
        ),
        body: Container(
          child: Stack(children: [
            Container(
              color: Colors.blue[100],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(DateFormat('yyy. MM.d(EEEE),').format(date),
                        style: GoogleFonts.lato(
                            fontSize: 20.0, color: Colors.white))
                    ,TimerBuilder.periodic(Duration(minutes: 1), builder: (context){
                      print('${getSystemTime()}');
                      return Text('${getSystemTime()}',style: GoogleFonts.lato(
                        fontSize:45.0,color:Colors.white
                      ),);
                    }),

                  ],
                )
                ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHomeButton(context, "베리", ScreenA()),
                    _buildHomeButton(context, "도어락", ScreenB()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHomeButton(context, "블라인드", ScreenA()),
                    _buildHomeButton(context, "조명", ScreenB()),
                  ],
                ),
              ],
            ),
          ]),
        ));
  }
}

Widget _buildHomeButton(BuildContext context, String title, Widget page) {
  return Container(
    width: 130,
    height: 130,
    margin: EdgeInsets.all(10),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Text(title,style: TextStyle(
        fontSize: 18.0
      ),),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
    ),
  );
}
