import 'package:flutter/material.dart';



class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScreenA'),
        ),
        body: Center(
          child: Text('ScreenA',
            style: TextStyle(
                fontSize: 20.0
            ),),
          // child: ElevatedButton(
          //   onPressed: () {Navigator.pop(ctx);},
          //   child: Text('Go to the First page'),
          // ),
        ));
  }
}
