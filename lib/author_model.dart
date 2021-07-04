import 'dart:convert';

List<AuthorModel> authorModelFromJson(String str) => List<AuthorModel>.from(json.decode(str).map((x) => AuthorModel.fromJson(x)));

String authorModelToJson(List<AuthorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuthorModel {
  AuthorModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
    id: json["id"],
    author: json["author"],
    width: json["width"],
    height: json["height"],
    url: json["url"],
    downloadUrl: json["download_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author": author,
    "width": width,
    "height": height,
    "url": url,
    "download_url": downloadUrl,
  };
}
