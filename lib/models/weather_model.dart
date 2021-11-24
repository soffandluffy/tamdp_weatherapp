// To parse this JSON data, do
//
//     final main = mainFromJson(jsonString);

import 'dart:convert';

class Main {
  Main({
    required this.id,
    required this.name,
    required this.cod,
    required this.weather,
    required this.main,
  });

  final int id;
  final String name;
  final int cod;
  final Weather weather;
  final MainClass main;

  factory Main.fromRawJson(String str) => Main.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
        weather: Weather.fromJson(json["weather"]),
        main: MainClass.fromJson(json["main"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cod": cod,
        "weather": weather.toJson(),
        "main": main.toJson(),
      };
}

class MainClass {
  MainClass({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.tempMin,
    required this.tempMax,
  });

  final double temp;
  final int pressure;
  final int humidity;
  final double tempMin;
  final double tempMax;

  factory MainClass.fromRawJson(String str) =>
      MainClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "pressure": pressure,
        "humidity": humidity,
        "temp_min": tempMin,
        "temp_max": tempMax,
      };
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
