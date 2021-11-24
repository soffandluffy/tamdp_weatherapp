// To parse this JSON data, do
//
//     final daily = dailyFromJson(jsonString);
import 'dart:convert';

class Daily {
  Daily({
    required this.lat,
    required this.lon,
    required this.daily,
  });

  final double lat;
  final double lon;
  final List<DailyElement> daily;

  factory Daily.fromRawJson(String str) => Daily.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        daily: List<DailyElement>.from(
            json["daily"].map((x) => DailyElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
      };
}

class DailyElement {
  DailyElement({
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

  factory DailyElement.fromRawJson(String str) =>
      DailyElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyElement.fromJson(Map<String, dynamic> json) => DailyElement(
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
    required this.night,
    required this.eve,
    required this.morn,
  });

  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  factory Temp.fromRawJson(String str) => Temp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
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
