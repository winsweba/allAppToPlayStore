import 'package:fashionbook/WallpaperApp/africamWearMen.dart';
import 'package:fashionbook/WallpaperApp/africamWearWomen.dart';
import 'package:fashionbook/WallpaperApp/africanWearAgbada.dart';
import 'package:fashionbook/WallpaperApp/africanWearAngi.dart';
import 'package:fashionbook/WallpaperApp/africanWearAsoOke.dart';
import 'package:fashionbook/WallpaperApp/africanWearKids.dart';
import 'package:fashionbook/WallpaperApp/wall_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

// final List<Widget> _listItemW = [
//     HomePage(),
//   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: Icon(Icons.menu),
        title: Text("Home"),
        centerTitle: true,
        // actions: <Widget>[
        //   Padding(
        //     padding: EdgeInsets.all(10.0),
        //     child: Container(
        //       width: 36,
        //       height: 30,
        //       decoration: BoxDecoration(
        //         color: Colors.grey[800],
        //         borderRadius: BorderRadius.circular(10)
        //       ),
        //       child: Center(child: Text("0")),
        //     ),
        //   )
        // ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/all.jpg'),
                    fit: BoxFit.cover
                  )
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ]
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("All Styles", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new WallScreen(),
                            ),);
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child: Center(child: Text("Show Now", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
                        ),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [

                    // My grid view 
                    // 1
                    Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new AfricamWearWomen(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/all.jpg'),
                            fit: BoxFit.cover
                          )
                        ),
                        child: Transform.translate(
                          offset: Offset(50, -50),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Icon(Icons.favorite,color: Colors.redAccent, size: 15,),
                          ),
                        ),
                      ),
                    ),
                  ),
  
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new AfricanWearAgbada(),
                            ),);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/Agbada.jpg'),
                            fit: BoxFit.cover
                          )
                        ),
                        child: Transform.translate(
                          offset: Offset(50, -50),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Icon(Icons.favorite,color: Colors.redAccent, size: 15,),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new AfricanWearKids(),
                            ),);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/kid.jpg'),
                            fit: BoxFit.cover
                          )
                        ),
                        child: Transform.translate(
                          offset: Offset(50, -50),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Icon(Icons.favorite,color: Colors.redAccent, size: 15,),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new AfricanWearAsoOke(),
                            ),);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/AsoOke.jpg'),
                            fit: BoxFit.cover
                          )
                        ),
                        child: Transform.translate(
                          offset: Offset(50, -50),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Icon(Icons.favorite,color: Colors.redAccent, size: 15,),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new AfricanWearAngi(),
                            ),);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/angi.jpg'),
                            fit: BoxFit.cover
                          )
                        ),
                        child: Transform.translate(
                          offset: Offset(50, -50),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Icon(Icons.favorite,color: Colors.redAccent, size: 15,),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new AfricamWearMen(),
                            ),);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/man.jpg'),
                            fit: BoxFit.cover
                          )
                        ),
                        child: Transform.translate(
                          offset: Offset(50, -50),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Icon(Icons.favorite,color: Colors.redAccent, size: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
