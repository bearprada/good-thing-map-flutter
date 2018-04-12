class Scrap {
  num id;
  double x;
  double y;
  double scale;
  double rotation;
  double width;
  double height;
  String sourceUrl;

  Scrap(num id, double x, double y, double scale, double rotation, double width, double height, String url) :
    id = id,
    x = x,
    y = y,
    scale = scale,
    rotation = rotation,
    width = width,
    height = height,
    sourceUrl = url;
}