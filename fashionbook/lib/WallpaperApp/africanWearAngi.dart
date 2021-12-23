

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashionbook/WallpaperApp/fullscreen_image.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

const String testDevice = '';

class AfricanWearAngi extends StatefulWidget {

  @override
  _AfricanWearAngiState createState() => new _AfricanWearAngiState();
}

class _AfricanWearAngiState extends State<AfricanWearAngi> {

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo();

  BannerAd createBannerAdd() {
    return BannerAd(
        targetingInfo: targetingInfo,
        adUnitId: "ca-app-pub-2635835949649414/4879891971",
        size: AdSize.smartBanner,
        listener: (MobileAdEvent event) {
          print('Bnner Event: $event');
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        targetingInfo: targetingInfo,
        adUnitId: "ca-app-pub-2635835949649414/5043543508",
        listener: (MobileAdEvent event) {
          print('interstitial event: $event');
        });
  }


  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> wallpapersList;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("africanWearAngi");

//       africamWearMen

// africamWearWomen

// africanWearAgbada

// africanWearAngi

// africanWearAsoOke

// africanWearKids

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        wallpapersList = datasnapshot.docs;
      });
    });

    // _currentScreen();
    
    // ADS ADMOB
    
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-2635835949649414~3949953683');
    _bannerAd = createBannerAdd()..load();

     _interstitialAd = createInterstitialAd()..load();

  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 10), () {
      _bannerAd?.show();
    });

    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          title: new Text("Fashion Book"),
        ),
        body: wallpapersList != null
            ? new StaggeredGridView.countBuilder(
                padding: const EdgeInsets.all(8.0),
                crossAxisCount: 4,
                itemCount: wallpapersList.length,
                itemBuilder: (context, i) {

                  String imgPath = wallpapersList[i].get("url");

                  return new Material(
                    elevation: 8.0,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(8.0)),
                    child: new InkWell(
                      onTap: () {
                        _bannerAd?.dispose();
                        _bannerAd = null;
                        _interstitialAd?.show();
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new FullScreenImagePage(imgPath),
                            ),
                      );
                      },
                      child: new Hero(
                        tag: imgPath,
                        child: new FadeInImage(
                          image: new NetworkImage(imgPath),
                          fit: BoxFit.cover,
                          placeholder: new AssetImage("assets/wallfy.png"),
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (i) =>
                    new StaggeredTile.count(2, i.isEven ? 2 : 3),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              )
            : new Center(
                child: new CircularProgressIndicator(),
      ));
  }           
}


// Fluttertoast.showToast(
//         msg: "This is Center Short Toast",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0
//     );