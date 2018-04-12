import 'package:flutter/material.dart';

import 'package:good_thing_map_flutter_app/model/StoryCategory.dart';
import 'package:good_thing_map_flutter_app/presentation/widget/CollageWidget.dart';
import 'package:good_thing_map_flutter_app/presentation/widget/HomeWidget.dart';
import 'package:good_thing_map_flutter_app/presentation/widget/StoryListWidget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: new StoryListWidget(category: new StoryCategory(1, "Food")),
//      home: new HomeWidget(),
      home: new CollageWidget(title: "PicCollage"),
    );
  }
}
