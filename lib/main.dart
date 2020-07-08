import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  AnimationController _breathingController;
  var _breathe =0.0;

  @override
  void initState() { 
    super.initState();

      _breathingController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
        _breathingController.addStatusListener((status) {
          if(status == AnimationStatus.completed){
            _breathingController.reverse();

          } else if (status == AnimationStatus.dismissed){
            _breathingController.forward();
          }
        });

        _breathingController.addListener(() {
          setState(() {
            _breathe =_breathingController.value;
          });
        });
        _breathingController.forward();

           }
      



  
  @override
  Widget build(BuildContext context) {
    final size = 200.0 -100.0 * _breathe;
    return Scaffold(
      body:Center(
        child: Container(
          height: size,
          width:size,
          child: Material(
            borderRadius: BorderRadius.circular(size/3),
            color: Colors.blueAccent,
            child: Icon(
              Icons.home,
              size:100,
              color:Colors.white,

            ),

          ),
        ),
      ),
      
    );
  }


}