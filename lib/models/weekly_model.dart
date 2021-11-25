// To parse this JSON data, do
//
//     final weekly = weeklyFromJson(jsonString);
import 'dart:convert';

class Weekly {
  Weekly({
    required this.dt,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.weather,
  });

  final int dt;
  final Temp temp;
  final int pressure;
  final int humidity;
  final List<Weather> weather;

  factory Weekly.fromRawJson(String str) => Weekly.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Weekly.fromJson(Map<String, dynamic> json) => Weekly(
        dt: json["dt"],
        temp: Temp.fromJson(json["temp"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "temp": temp.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
      };
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
  });

  final double day;
  final double min;
  final double max;

  factory Temp.fromRawJson(String str) => Temp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
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
