import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  final String assetImagePath;

  const CategoryListItem(this.assetImagePath, {
    Key key,
  }) : assert(assetImagePath != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new LimitedBox(
        maxHeight: 48.0,
        child: new Image(image: new AssetImage(assetImagePath)),
      ),
    );
  }
}