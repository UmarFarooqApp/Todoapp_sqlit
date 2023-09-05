import 'dart:async';

import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  double _progress = 0.0;
  double _progress1 = 0.0;
  double _progress2 = 0.0;
  double _progress3 = 0.0;

  @override
  void initState() {
    super.initState();

    // Start a timer to animate the progress over one minute.
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_progress < 1.0) {
        setState(() {
          _progress += 0.01;
        });
      }
      else if(_progress1<1.0){
        setState(() {
          _progress1 += 0.01;
        });
      }
      else if(_progress2<1.0){
        setState(() {
          _progress2 += 0.01;
        });
      }
      else if(_progress3<1.0){
        setState(() {
          _progress3 += 0.01;
        });
      }


      else {
        timer.cancel(); // Stop the timer when the progress is complete.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicators'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildProgressIndicator(_progress),
            SizedBox(width: 10),
            buildProgressIndicator(_progress1),
            SizedBox(width: 10),
            buildProgressIndicator(_progress2),
            SizedBox(width: 10),
            buildProgressIndicator(_progress3),
          ],
        ),
      ),
    );
  }

  Widget buildProgressIndicator(progress) {
    return Container(
      width: 60,
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
        height: 10,
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
        decoration: BoxDecoration(
          color: Colors.blue,
         // borderRadius: BorderRadius.circular(5),
        ),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: progress,
          child: Container(
            width: 40,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}