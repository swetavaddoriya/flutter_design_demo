// To parse this JSON data, do
//
//     final depositResponse = depositResponseFromJson(jsonString);

import 'dart:convert';

VideoModel depositResponseFromJson(String str) => VideoModel.fromJson(json.decode(str));

String depositResponseToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  int status;
  String message;
  List<Data> data;

  VideoModel({
    this.status,
    this.message,
    this.data,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),


  };

}

class Data {
  String videoId;
  String lanId;
  String userId;
  String videoUrl;
  String videoThumb;
  String title;
  String description;
  String userName;
  String profile;
  String isLike;
  bool isFev;
  bool isFollow;
  String shareCnt;
  String cmtCnt;
  String likeCnt;
  String loveCnt;
  String woowCnt;
  String hahaCnt;
  String angryCnt;
  String sadCnt;

  Data({
    this.videoId,
    this.lanId,
    this.userId,
    this.videoUrl,
    this.videoThumb,
    this.title,
    this.description,
    this.userName,
    this.profile,
    this.isLike,
    this.isFev,
    this.isFollow,
    this.shareCnt,
    this.cmtCnt,
    this.likeCnt,
    this.loveCnt,
    this.woowCnt,
    this.hahaCnt,
    this.angryCnt,
    this.sadCnt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    videoId: json["video_id"] == null ? null : json["video_id"],
    lanId: json["lan_id"] == null ? null : json["lan_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    videoUrl: json["video_url"] == null ? null : json["video_url"],
    videoThumb: json["video_thumb"] == null ? null : json["video_thumb"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    userName: json["user_name"] == null ? null : json["user_name"],
    profile: json["profile"] == null ? null : json["profile"],
    isLike: json["is_like"] == null ? null : json["is_like"],
    isFev: json["is_fev"] == null ? null : json["is_fev"],
    isFollow: json["is_follow"] == null ? null : json["is_follow"],
    shareCnt: json["share_cnt"] == null ? null : json["share_cnt"],
    cmtCnt: json["cmt_cnt"] == null ? null : json["cmt_cnt"],
    likeCnt: json["like_cnt"] == null ? null : json["like_cnt"],
    loveCnt: json["love_cnt"] == null ? null : json["love_cnt"],
    woowCnt: json["woow_cnt"] == null ? null : json["woow_cnt"],
    hahaCnt: json["haha_cnt"] == null ? null : json["haha_cnt"],
    angryCnt: json["angry_cnt"] == null ? null : json["angry_cnt"],
    sadCnt: json["sad_cnt"] == null ? null : json["sad_cnt"],
  );

  Map<String, dynamic> toJson() => {
    "video_id": videoId == null ? null : videoId,
    "lan_id": lanId == null ? null : lanId,
    "user_id": userId == null ? null : userId,
    "video_url": videoUrl == null ? null : videoUrl,
    "video_thumb": videoThumb == null ? null : videoThumb,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "user_name": userName == null ? null : userName,
    "profile": profile == null ? null : profile,
    "is_like": isLike == null ? null : isLike,
    "is_fev": isFev == null ? null : isFev,
    "is_follow": isFollow == null ? null : isFollow,
    "share_cnt": shareCnt == null ? null : shareCnt,
    "cmt_cnt": cmtCnt == null ? null : cmtCnt,
    "like_cnt": likeCnt == null ? null : likeCnt,
    "love_cnt": loveCnt == null ? null : loveCnt,
    "woow_cnt": woowCnt == null ? null : woowCnt,
    "haha_cnt": hahaCnt == null ? null : hahaCnt,
    "angry_cnt": angryCnt == null ? null : angryCnt,
    "sad_cnt": sadCnt == null ? null : sadCnt,
  };
}
