import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wins_wallpaperapp/data/data.dart';
import 'package:wins_wallpaperapp/models/wallpaper_model.dart';
import 'package:wins_wallpaperapp/widget/app_title.dart';


class Categories extends StatefulWidget {

final String categoriesName;
  Categories({this.categoriesName});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

   TextEditingController searchController = new TextEditingController();
  List<WallpaperModel> wallpapers = new List();

getSearchWallpaper( String query) async{
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=20&page=1", 
    headers: {
      "Authorization" : apiKey,
    });
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
     // print(element);
     WallpaperModel wallpaperModel = new WallpaperModel();
     wallpaperModel = WallpaperModel.fromMap(element);
     wallpapers.add(wallpaperModel);
    });

    setState(() {
      
    });

  }

  @override
  void initState() {
    getSearchWallpaper(widget.categoriesName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:  brandName(),
        elevation: 0.1
      ),
        body: SingleChildScrollView(
        child: Container(
          child: Column(children: <Widget>[
              SizedBox(height: 16),
              wallpaperList(wallpapers: wallpapers,context: context),
          ],)
        ),
      ),
    );
  }
}