import 'package:flutter/material.dart';
import 'package:wins_recipe/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Recipe App',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      
      ),
      home: Home(),
    );
  }
}
