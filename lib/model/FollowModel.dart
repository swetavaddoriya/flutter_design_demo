
class FollowModel
{
  String user_Id,user_name,profile;
  FollowModel({this.user_Id, this.user_name, this.profile});


  factory FollowModel.fromJson(Map<String, dynamic> json) {
    return new FollowModel(
      user_Id: json['user_Id']as String,
      user_name: json['user_name'].toString(),
      profile: json['profile'].toString(),

    );


  }


}