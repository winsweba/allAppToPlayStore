import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wins_wallpaperapp/data/data.dart';
import 'package:wins_wallpaperapp/models/wallpaper_model.dart';
import 'package:wins_wallpaperapp/widget/app_title.dart';

class Search extends StatefulWidget {
  final String searchQuery;
  Search({this.searchQuery});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
 
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
    getSearchWallpaper(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
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
            Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Seaech or Wallpaper',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell( 
                      onTap: (){
                        getSearchWallpaper(searchController.text);
                      },
                      child: Container(child: Icon(Icons.search))),
                  ],
                ),
              ),
              SizedBox(height: 16),
              wallpaperList(wallpapers: wallpapers,context: context),
          ],)
        ),
      ),
    );
  }
}