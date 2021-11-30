// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/weather_provider.dart';
import 'package:weatherapp/widget/custom_rectangle.dart';
import 'package:weatherapp/widget/weather_info_column.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:intl/intl.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurrentDetailPage extends StatefulWidget {
  final int id;
  CurrentDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<CurrentDetailPage> createState() => _CurrentDetailPageState();
}

class _CurrentDetailPageState extends State<CurrentDetailPage> {

  @override
  Widget build(BuildContext context) {
    Widget weatherInfoColumn(
      IconData icon,
      String hour,
      String temperature,
    ) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            hour,
            style: const TextStyle(color: Colors.white),
          ),
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            temperature,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      );
    }

    Future<List<Weather>> getCurrentWeather(int id) async {
      return Provider.of<WeatherProvider>(context).getWeatherDetail(id);
    }

    return FutureBuilder<List<Weather>>(
      future: getCurrentWeather(widget.id),
      builder: (BuildContext context, AsyncSnapshot<List<Weather>> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              leading: Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
              title: Text(
                "Today's Forecast",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            if (snapshot.data != []) {
              // print(snapshot.data.toString());
              String icon = snapshot.data![0].weather[0].icon;
              int dt = snapshot.data![0].dt;
              var date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
              String formattedDate =
                  DateFormat('EEEE, d MMMM yyyy').format(date);
              double windspeed = snapshot.data![0].wind.speed;
              int humidity = snapshot.data![0].main.humidity;
              String condes = snapshot.data![0].weather[0].description;
              double tempp = snapshot.data![0].main.temp;
              double tempmax = snapshot.data![0].main.tempMax;
              double tempmin = snapshot.data![0].main.tempMin;
              String cityName = snapshot.data![0].name;
              int pressure = snapshot.data![0].main.pressure;

              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                  ),
                  title: Text(
                    formattedDate,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  elevation: 0,
                ),
                body: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "$cityName".toUpperCase(),
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.blue,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: Text(
                          "$condes".toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Center(
                        child: Image.network(
                          "http://openweathermap.org/img/w/$icon.png",
                        ),
                      ),
                      Center(
                        child: Text(
                          "${tempp.toString()}°",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 120),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text("max"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("${tempmax.toString()}°"),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("min"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("${tempmin.toString()}°"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomRectangle(
                            Colors.orange,
                            Colors.red,
                            IndicatorType.start,
                            const EdgeInsets.symmetric(horizontal: 5),
                            weatherInfoColumn(
                              FontAwesomeIcons.wind,
                              "Wind Speed",
                              "${windspeed.toString()} m/s",
                            ),
                          ),
                          CustomRectangle(
                            Colors.purple,
                            Colors.deepPurple,
                            IndicatorType.middle,
                            const EdgeInsets.symmetric(horizontal: 5),
                            weatherInfoColumn(
                              WeatherIcons.humidity,
                              "Humidity",
                              "${humidity.toString()} %",
                            ),
                          ),
                          CustomRectangle(
                            Colors.blue,
                            Colors.lightBlue,
                            IndicatorType.end,
                            const EdgeInsets.symmetric(horizontal: 5),
                            weatherInfoColumn(
                              FontAwesomeIcons.smog,
                              "Air Pressure",
                              "${pressure.toString()} hPa",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: Text("Data not found"),
                ),
              );
            }
          } // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    );
  }
}
