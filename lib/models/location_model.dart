// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);
import 'dart:convert';

class Location {
  Location({
    required this.id,
    required this.name,
    required this.lat,
    required this.lon,
  });

  final int id;
  final String name;
  final double lat;
  final double lon;

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lat": lat,
        "lon": lon,
      };
}
