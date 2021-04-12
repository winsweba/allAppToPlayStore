import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'WallpaperApp/wall_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: new WallScreen(analytics: analytics, observer: observer),
      home: new WallScreen(),
    );
  }
}