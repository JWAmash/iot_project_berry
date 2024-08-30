import 'package:flutter/material.dart';



class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScreenB'),
        ),
        body: Center(
          child: Text('ScreenB',
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
