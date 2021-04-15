import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color/random_color.dart';
import 'package:share/share.dart';

class FullScreenQuotePage extends StatefulWidget {

  String quote;
  FullScreenQuotePage(this.quote);

  @override
  _FullScreenQuotePageState createState() => _FullScreenQuotePageState();
}

class _FullScreenQuotePageState extends State<FullScreenQuotePage> {
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo();

  BannerAd createBannerAdd() {
    return BannerAd(
        targetingInfo: targetingInfo,
        adUnitId: "ca-app-pub-2635835949649414/7196948021",
        size: AdSize.smartBanner,
        listener: (MobileAdEvent event) {
          print('Bnner Event: $event');
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        targetingInfo: targetingInfo,
        adUnitId: "ca-app-pub-2635835949649414/9613343909",
        listener: (MobileAdEvent event) {
          print('interstitial event: $event');
        });
  }
  
    @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _currentScreen();
    // 
    // ADS ADMOB
    
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-2635835949649414~7580091406');
    _bannerAd = createBannerAdd()..load();

     _interstitialAd = createInterstitialAd()..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }
  final RandomColor _randomColor = RandomColor();

  final LinearGradient backgroundGradient = new LinearGradient(
      colors: [new Color(0x10000000), new Color(0x30000000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: _randomColor.randomColor(
                      colorBrightness: ColorBrightness.light
                    ),
      body: new SizedBox.expand(
        child: new Container(
          decoration: new BoxDecoration(gradient: backgroundGradient),
          child: new Stack(
            children: <Widget>[
              new Align(
                alignment: Alignment.center,
                child: Text(widget.quote, textAlign: TextAlign.center,
                        style: GoogleFonts.dosis(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ) ),
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
                          color: Colors.redAccent,
                          size: 38.0,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      actions: [IconButton(icon: Icon(Icons.share, size: 36,), onPressed: () {
                        _bannerAd?.dispose();
                        _bannerAd = null;
                        _interstitialAd?.show();
                        share(context, widget.quote);
                      }  , )],
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

  void share(BuildContext context,String quotes){
    final RenderBox box = context.findRenderObject();
    final String text  = "${quotes.toString()}";

    Share.share(text, subject: quotes.toString());
    
    // Share.shareFiles(text, subject: quotes.toString());
  }
}
