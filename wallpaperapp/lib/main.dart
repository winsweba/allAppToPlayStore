import 'package:flutter/material.dart';
import 'package:wallpaperapp/admob_service.dart';
import 'package:wallpaperapp/screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wins Wallpaper',
      theme: ThemeData(
      
        primaryColor: Colors.white,
      
      ),
      home: Home(),
    );
  }
}
