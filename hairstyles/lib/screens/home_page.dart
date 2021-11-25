import 'package:flutter/material.dart';
import 'package:hairstyles/screens/hairBraidedPonytail.dart';
import 'package:hairstyles/screens/hairFulaniBraids.dart';
import 'package:hairstyles/screens/hairKnotlessBraids.dart';
import 'package:hairstyles/screens/hairLemonadebraids.dart';
import 'package:hairstyles/screens/hairPassionTwists.dart';
import 'package:hairstyles/screens/hairTriangleBoxBbraids.dart';
import 'package:hairstyles/screens/hair_grid_screen.dart';

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
                    image: AssetImage('assets/one.jpg'),
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
                      Text("All hairstyle", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
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
                              builder: (context) => new HairTriangleBoxBbraids(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/two.jpg'),
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
                            child: Icon(Icons.bookmark_border, size: 15,),
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
                              builder: (context) => new HairPassionTwists(),
                            ),);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/three.jpg'),
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
                            child: Icon(Icons.bookmark_border, size: 15,),
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
                              builder: (context) => new HairFulaniBraids(),
                            ),);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/four.jpg'),
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
                            child: Icon(Icons.bookmark_border, size: 15,),
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
                              builder: (context) => new HairLemonadebraids(),
                            ),);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/five.jpg'),
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
                            child: Icon(Icons.bookmark_border, size: 15,),
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
                              builder: (context) => new HairBraidedPonytail(),
                            ),);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/one.jpg'),
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
                            child: Icon(Icons.bookmark_border, size: 15,),
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
                              builder: (context) => new HairKnotlessBraids(),
                            ),);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage('assets/six.jpg'),
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
                            child: Icon(Icons.bookmark_border, size: 15,),
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
