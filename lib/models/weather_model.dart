// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Weather {
    Weather({
        required this.weather,
        required this.main,
        required this.wind,
        required this.dt,
        required this.id,
        required this.name,
        required this.cod,
    });

    final List<WeatherElement> weather;
    final Main main;
    final Wind wind;
    final int dt;
    final int id;
    final String name;
    final int cod;

    factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        weather: List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
        main: Main.fromJson(json["main"]),
        wind: Wind.fromJson(json["wind"]),
        dt: json["dt"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
    );

    Map<String, dynamic> toJson() => {
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "main": main.toJson(),
        "wind": wind.toJson(),
        "dt": dt,
        "id": id,
        "name": name,
        "cod": cod,
    };
}

class Main {
    Main({
        required this.temp,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.humidity,
    });

    final double temp;
    final double tempMin;
    final double tempMax;
    final int pressure;
    final int humidity;

    factory Main.fromRawJson(String str) => Main.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
    };
}

class WeatherElement {
    WeatherElement({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    final int id;
    final String main;
    final String description;
    final String icon;

    factory WeatherElement.fromRawJson(String str) => WeatherElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
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

class Wind {
    Wind({
        required this.speed,
    });

    final double speed;

    factory Wind.fromRawJson(String str) => Wind.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
    };
}
