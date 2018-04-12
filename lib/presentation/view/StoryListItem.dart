import 'package:flutter/material.dart';

class StoryListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String address;
  final String distance;
  final bool hasBooked; // TODO later version

  const StoryListItem(this.title, {
    Key key,
    this.imageUrl,
    this.address,
    this.distance,
    this.hasBooked,
  }) : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: new Row(
        children: <Widget>[
          new Container(
            child: new SizedBox(
              width: 76.0,
              height: 76.0,
              child: new Image.network(imageUrl),
            ),
          ),
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(title,
                      maxLines: 1,
                      style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                  new Text(address,
                      maxLines: 1,
                      style: new TextStyle(fontSize: 14.0)),
                ],
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: new LimitedBox(
              maxWidth: 24.0,
              child: new Text(distance,
                maxLines: 1,
                style: new TextStyle(fontSize: 14.0)
              ),
            ),
          ),
        ],
      ),
    );
  }
}