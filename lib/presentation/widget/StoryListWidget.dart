import 'dart:convert';
import 'dart:io';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:geo/geo.dart';
import 'package:location/location.dart';
import 'package:good_thing_map_flutter_app/model/StoryCategory.dart';
import 'package:good_thing_map_flutter_app/presentation/view/StoryListItem.dart';
import 'package:good_thing_map_flutter_app/model/Story.dart';


class StoryListWidget extends StatefulWidget {
  final StoryCategory category;

  StoryListWidget({Key key, this.category}) : super(key: key);

  @override
  _StoryListWidgetState createState() => new _StoryListWidgetState();
}

class _StoryListWidgetState extends State<StoryListWidget> {
  List<GoodThing> stories = new List();
  String errorMsg;
  LatLng currentLocation;

  var httpClient = new HttpClient();
  var location = new Location();

  @override
  void initState() {
    super.initState();
    _getHomeFeed(widget.category.categoryIndex);
    // TODO move to service
    // FIXME location library got crash, it might because I try to upgrade project
    // to Dart 2.0
    location.onLocationChanged.firstWhere((Map<String,double> result) {
      setState(() {
        currentLocation = new LatLng(result["latitude"], result["longitude"]);
      });
    });
//    currentLocation = new LatLng(1, 1);

  }

  // TODO move to service
  String _getLocationInfo(LatLng l1, LatLng l2) {
    print("_getLocationInfo " + l1.toString());
    if (l1 == null || l2 == null) {
      return "N/a";
    }
    return computeDistanceBetween(l1, l2).toString();
  }

  // TODO move to service
  _getHomeFeed(num categoryIndex) async {
     var url = 'http://goodthing.tw:8080/good_thing/mobile/findGoodThings?type=' + categoryIndex.toString();
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var jsonString = await response.transform(utf8.decoder).join();
        var data = json.decode(jsonString);
        var result = data['results'];
        var list = new List<GoodThing>();
        for (var i = 0 ; i < 1000 ; i ++) {
          for (var item in result) {
            list.add(new GoodThing.fromJson(item));
          }
        }
        debugPrint(list.toString());
        setState(() { stories = list; });
      } else {
        setState(() { errorMsg = 'Failed getting stories from server:\nHttp status ${response.statusCode}'; });
      }
    } catch (exception) {
      setState(() { errorMsg = 'Failed getting stories from server'; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.category.categoryName),
      ),
      body: new Center(
        child: new ListView(
          children: stories.map((story) =>
            new StoryListItem(story.title,
              address: story.address,
              imageUrl: story.listImageUrl,
              distance: _getLocationInfo(currentLocation, story.location),
              hasBooked: false,
            )
          ).toList(),
        ),
      ),
    );
  }
}