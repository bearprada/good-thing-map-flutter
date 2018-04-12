import 'package:geo/geo.dart';

class GoodThing {
  num id;
  String title;
  List<dynamic> message;
  String imageUrl;
  String listImageUrl;
  String detailImageUrl;
  String story;
  String address;
  String memo;
  LatLng location;

  GoodThing.fromJson(Map<String, dynamic> json) :
    id = json["gid"],
    title = json["title"],
    message = new List(), // FIXME
    imageUrl = json["image_url"],
    listImageUrl = json["list_image_url"],
    detailImageUrl = json["detail_image_url"],
    story = json["story"],
    address = json["address"],
    memo = json["memo"],
    location = new LatLng(json["longtitude"], json["latitude"]);
}


////  @SerializedName("gid")
//  private int id;
////  @SerializedName("title")
//  private String title;
////  @SerializedName("messages")
////  @SerializedName("imageUrl")
//  private String imageUrl;
////  @SerializedName("list_image_url")
//  private String listImageUrl;
////  @SerializedName("detail_image_url")
//  private String detailImageUrl;
////  @SerializedName("story")
//  private String story;
////  @SerializedName("address")
//  private String address;
////  @SerializedName("memo")
//  private String memo;
////  @SerializedName("longtitude")
//  private float longtitude;
////  @SerializedName("latitude")
//  private float latitude;
////  @SerializedName("time")
//  private long time;
////  @SerializedName("business_time")
//  private String businessTime;
////  @SerializedName("content")
//  private String content;
////  @SerializedName("can_post")
//  private boolean canPost;
////  @SerializedName("is_big_issue")
//  private boolean isBigIssue;
////  @SerializedName("images")
//  private List<String> images = new ArrayList<String>();