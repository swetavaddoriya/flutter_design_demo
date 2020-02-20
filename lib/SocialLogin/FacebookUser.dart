class FacebookUser {
  String name;
  Picture picture;
  String email;
  String id;

  FacebookUser({
    this.name,
    this.picture,
    this.email,
    this.id,
  });

  factory FacebookUser.fromJson(Map<String, dynamic> json) => new FacebookUser(
    name: json["name"],
    picture: Picture.fromJson(json["picture"]),
    email: json["email"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "picture": picture.toJson(),
    "email": email,
    "id": id,
  };
}

class Picture {
  Data data;

  Picture({
    this.data,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => new Picture(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  int height;
  bool isSilhouette;
  String url;
  int width;

  Data({
    this.height,
    this.isSilhouette,
    this.url,
    this.width,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    height: json["height"],
    isSilhouette: json["is_silhouette"],
    url: json["url"],
    width: json[" width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "is_silhouette": isSilhouette,
    "url": url,
    " width": width,
  };
}
