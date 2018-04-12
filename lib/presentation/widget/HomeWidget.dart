import 'package:flutter/material.dart';
import 'package:good_thing_map_flutter_app/presentation/view/CategoryListItem.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => new _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("好事地圖"),
      ),
      body: new Row(
        children: <Widget>[
          new SizedBox(
            width: 100.0,
            height: 100.0,
            // child: new Image(image: new AssetImage("images/im_02.snack.png")),
            child: new Image.network("http://goodthing.tw:8080/good_thing/assets/good_thing_list_25_807ae701-0da4-44bd-a12c-aa7178d56dcc.jpg"),
          ),
          new CategoryListItem("images/im_02.snack.png"),
          new CategoryListItem("images/im_02.snack.png"),
          new CategoryListItem("images/im_02.snack.png"),
          new CategoryListItem("images/im_02.snack.png"),
          new CategoryListItem("images/im_02.snack.png"),
          new CategoryListItem("images/im_02.snack.png"),
        ],
      ),
    );
  }

}