import 'package:flutter/material.dart';
import 'package:good_thing_map_flutter_app/model/Scrap.dart';

class CollageWidget extends StatefulWidget {
  CollageWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CollageWidgetState createState() => new _CollageWidgetState();
}

class _CollageWidgetState extends State<CollageWidget> {
  var scraps = <Scrap>[
    new Scrap(1, 0.0, 0.0, 1.0, 0.0, 128.0, 128.0, "https://images.medicaldaily.com/sites/medicaldaily.com/files/styles/full_breakpoints_theme_medicaldaily_desktop_1x/public/2015/08/18/selfie-time.jpg"),
    new Scrap(2, 20.0, 20.0, 1.0, 0.0, 128.0, 128.0, "https://images.medicaldaily.com/sites/medicaldaily.com/files/styles/full_breakpoints_theme_medicaldaily_desktop_1x/public/2015/08/18/selfie-time.jpg"),
//    new Scrap(3, 30.0, 300.0, 1.0, 0.0, 128.0, 128.0, "https://images.medicaldaily.com/sites/medicaldaily.com/files/styles/full_breakpoints_theme_medicaldaily_desktop_1x/public/2015/08/18/selfie-time.jpg"),
//    new Scrap(4, 40.0, 400.0, 1.0, 0.0, 128.0, 128.0, "https://images.medicaldaily.com/sites/medicaldaily.com/files/styles/full_breakpoints_theme_medicaldaily_desktop_1x/public/2015/08/18/selfie-time.jpg"),
//    new Scrap(5, 50.0, 500.0, 1.0, 0.0, 128.0, 128.0, "https://images.medicaldaily.com/sites/medicaldaily.com/files/styles/full_breakpoints_theme_medicaldaily_desktop_1x/public/2015/08/18/selfie-time.jpg"),
//    new Scrap(6, 60.0, 600.0, 1.0, 0.0, 128.0, 128.0, "https://images.medicaldaily.com/sites/medicaldaily.com/files/styles/full_breakpoints_theme_medicaldaily_desktop_1x/public/2015/08/18/selfie-time.jpg"),
  ];

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Stack(
        alignment: Alignment.center,
        children: scraps.map((scrap) =>
          new GestureDetector(
            onTap: () {
              debugPrint("onTap - > " + scrap.id.toString());
            },
            onPanUpdate: (detail) {
              debugPrint("onPanUpdate - > " + scrap.id.toString());
              setState(() {
                scrap.x += detail.delta.dx;
                scrap.y += detail.delta.dy;
              });
            },
//            onScaleUpdate: (detail) {
//              debugPrint("update scale = " + detail.scale.toString());
//            },
            child: new Transform(
              transform: new Matrix4.identity()
                ..scale(scrap.scale)
                ..translate(scrap.x, scrap.y),
              child: new SizedBox(
                width: scrap.width,
                height: scrap.height,
                child: new Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(color: new Color(0xFFFF0000))
                  ),
                  child: new Image.network(scrap.sourceUrl),
                ),
              ),
            ),
          )).toList(),
      ),
    );
  }
}