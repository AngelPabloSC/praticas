// To parse this JSON data, do
//
//     final prueba = pruebaFromJson(jsonString);

import 'dart:convert';

Prueba pruebaFromJson(String str) => Prueba.fromJson(json.decode(str));

String pruebaToJson(Prueba data) => json.encode(data.toJson());

class Prueba {
  bool success;
  int totalPhotos;
  String message;
  int offset;
  int limit;
  List<Photo> photos;

  Prueba({
    required this.success,
    required this.totalPhotos,
    required this.message,
    required this.offset,
    required this.limit,
    required this.photos,
  });

  factory Prueba.fromJson(Map<dynamic, dynamic> json) => Prueba(
    success: json["success"],
    totalPhotos: json["total_photos"],
    message: json["message"],
    offset: json["offset"],
    limit: json["limit"],
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "total_photos": totalPhotos,
    "message": message,
    "offset": offset,
    "limit": limit,
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
  };
}

class Photo {
  String url;
  int user;
  String title;
  int id;
  String description;

  Photo({
    required this.url,
    required this.user,
    required this.title,
    required this.id,
    required this.description,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    url: json["url"],
    user: json["user"],
    title: json["title"],
    id: json["id"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "user": user,
    "title": title,
    "id": id,
    "description": description,
  };
}
