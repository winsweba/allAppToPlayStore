
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
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
  var filePath;

  GlobalKey globalKey = GlobalKey();

  final LinearGradient backgroundGradient = new LinearGradient(
      colors: [new Color(0x10000000), new Color(0x30000000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  @override
  Widget build(BuildContext context) {
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
                         onPressed: () => _save() )
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


  // Future<void> saveImage (String _name) async {
  //   final status = await Permission.storage.request();

  //               if (status.isGranted) {
  //                 final externalDir = await getExternalStorageDirectory();

  //                 final dir = await getApplicationDocumentsDirectory();

  //                 var _localPath = dir.path +  _name;
                  
  //                 final savedDir = Directory(_localPath);

  //                 final id = await FlutterDownloader.enqueue(
  //                   url: imgPath,
  //                   savedDir: externalDir.path + "Download",
  //                   fileName: "download",
  //                   showNotification: true,
  //                   openFileFromNotification: true,
  //                 );


  //               } else {
  //                 print("Permission deined");
  //               }
  // }

  // Future<void> saveImage (String _name) async {
  //   final status = await Permission.storage.request();

  //               if (status.isGranted) {
  //                 // final externalDir = await getExternalStorageDirectory();

  //                 final dir = await getApplicationDocumentsDirectory();

  //                 var _localPath = dir.path +  _name;
                  
  //                 final savedDir = Directory(_localPath);

  //                 await savedDir.create(recursive: true).then((value) async{

  //                   String _task = await FlutterDownloader.enqueue(
  //                   url: imgPath,
  //                   savedDir: _localPath,
  //                   fileName: "download",
  //                   showNotification: true,
  //                   openFileFromNotification: true,
  //                 );
  //                 print(_task);

  //                 });

  //               } else {
  //                 print("Permission deined");
  //               }
  // }

  // Future<void> _save() async {
  //   RenderRepaintBoundary boundary =
  //       globalKey.currentContext.findRenderObject();
  //   ui.Image image = await boundary.toImage();
  //   ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List pngBytes = byteData.buffer.asUint8List();

  //   //Request permissions if not already granted
  //   if (!(await Permission.storage.status.isGranted))
  //     await Permission.storage.request();

  //   final result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(pngBytes),
  //       quality: 60,
  //       name: "canvas_image");
  //   print(result);
  // }

  // _save() async {
  //  var response = await Dio().get(
  //          "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
  //          options: Options(responseType: ResponseType.bytes));
  //  final result = await ImageGallerySaver.saveImage(
  //          Uint8List.fromList(response.data),
  //          quality: 60,
  //          name: "hello");
  //  print(result);
  // }
  // 
  _save() async {
    // await _askPermission();
    if (await Permission.storage.request().isGranted){
    var response = await Dio().get(widget.imgPath,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    }
  }

  // _askPermission() async {
  //   if (Platform.isIOS) {
  //     Map<PermissionGroup, PermissionStatus> permissions =
  //         await PermissionHandler()
  //             .requestPermissions([PermissionGroup.photos]);
  //   } else {
  //     PermissionStatus permission = await PermissionHandler()
  //         .checkPermissionStatus(PermissionGroup.storage);
  //   }
  // }

}



// Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
// Share.shareFiles(['${directory.path}/image1.jpg', '${directory.path}/image2.jpg']);
