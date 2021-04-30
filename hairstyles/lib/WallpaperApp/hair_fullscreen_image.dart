import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
// import 'package:image';
// import 'package:flutter/services.dart';
// import 'package:image_picker_saver/image_picker_saver.dart';
// import 'package:http/http.dart' as http;


class FullScreenImagePage extends StatefulWidget {
  String imgPath;
  FullScreenImagePage(this.imgPath);

  @override
  _FullScreenImagePageState createState() => _FullScreenImagePageState();
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo();

  BannerAd createBannerAdd() {
    return BannerAd(
        targetingInfo: targetingInfo,
        adUnitId: "ca-app-pub-2635835949649414/5477839530",
        size: AdSize.smartBanner,
        listener: (MobileAdEvent event) {
          print('Bnner Event: $event');
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        targetingInfo: targetingInfo,
        adUnitId: "ca-app-pub-2635835949649414/5286267848",
        listener: (MobileAdEvent event) {
          print('interstitial event: $event');
        });
  }
  
    @override
  void initState() {
    // TODO: implement initState
    super.initState(); 
    // ADS ADMOB
    
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-2635835949649414~4356329552');
    _bannerAd = createBannerAdd()..load();

     _interstitialAd = createInterstitialAd()..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  var filePath;

  GlobalKey globalKey = GlobalKey();

  final LinearGradient backgroundGradient = new LinearGradient(
      colors: [new Color(0x10000000), new Color(0x30000000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 10), () {
      _bannerAd?.show();
    });
    
    return new Scaffold(
      key: globalKey ,
      body: new SizedBox.expand(
        child: new Container(
          decoration: new BoxDecoration(gradient: backgroundGradient),
          child: new Stack(
            children: <Widget>[
              new Align(
                alignment: Alignment.center,
                child: new Hero(
                  tag: widget.imgPath,
                  child: new Image.network(widget.imgPath),
                ),
              ),
              new Align(
                alignment: Alignment.topCenter,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new AppBar(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      leading: new IconButton(
                        icon: new Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 26.0,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      actions: [
                        IconButton(icon: Icon(
                          Icons.save,
                          color: Colors.black,
                          size: 26.0,
                        ),
                         onPressed: () {
                        _bannerAd?.dispose();
                        _bannerAd = null;
                        _interstitialAd?.show();
                           _save();
                         } )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  _save() async {
    
    if (await Permission.storage.request().isGranted){
    var response = await Dio().get(widget.imgPath,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);

    

    Fluttertoast.showToast(
        msg: " Image Save to Gallery ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.black,
        fontSize: 16.0
    );

    }
  }

}



// Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
// Share.shareFiles(['${directory.path}/image1.jpg', '${directory.path}/image2.jpg']);
