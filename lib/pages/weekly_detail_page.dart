import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/models/weekly_model.dart';
import 'package:weatherapp/providers/weekly_provider.dart';
import 'package:provider/provider.dart';

class WeeklyDetailPage extends StatefulWidget {
  final double lat;
  final double lon;
  final String cityName;
  const WeeklyDetailPage({
    Key? key,
    required this.lat,
    required this.lon,
    required this.cityName,
  }) : super(key: key);

  @override
  State<WeeklyDetailPage> createState() => _WeeklyDetailPageState();
}

class _WeeklyDetailPageState extends State<WeeklyDetailPage> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar() {
      return AppBar(
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
          "Weekly Forecast",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      );
    }

    Widget weeklyCard(String day, String dat, String icon, double tempmax,
        double tempmin, int humidity) {
      return Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            day,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(dat)
                        ],
                      ),
                      Image.network(
                        "http://openweathermap.org/img/w/$icon.png",
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "${tempmax.toString()} \u2103",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${tempmin} \u2103"),
                      Icon(WeatherIcons.humidity),
                      Text("${humidity.toString()}%"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }

    Future<List<Weekly>> getWeeklyDetail(double lat, double lon) {
      return Provider.of<WeeklyProvider>(context).getWeeklyDetail(lat, lon);
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: appBar(),
      body: FutureBuilder<List<Weekly>>(
        future: getWeeklyDetail(widget.lat, widget.lon),
        builder: (BuildContext context, AsyncSnapshot<List<Weekly>> snapshot) {
          // AsyncSnapshot<Your object type>
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              if (snapshot.data != null) {
                String cond = snapshot.data!.first.weather[0].main;
                double temp = snapshot.data!.first.temp.day;
                double tempmax = snapshot.data!.first.temp.max;
                double tempmin = snapshot.data!.first.temp.min;
                String icon = snapshot.data![0].weather[0].icon;
                int dt = snapshot.data![0].dt;
                var date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
                String formattedDate = DateFormat('d MMM').format(date);
                int humidity = snapshot.data![0].humidity;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cityName,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cond,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 48),
                                      ),
                                      Text(
                                        "${temp.toString()} \u2103",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 24),
                                      ),
                                    ],
                                  ),
                                  Image.network(
                                    "http://openweathermap.org/img/w/$icon.png",
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Today,",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(formattedDate)
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "${tempmax.toString()} \u2103",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("${tempmin.toString()} \u2103"),
                                  Icon(WeatherIcons.humidity),
                                  Text("${humidity.toString()}%"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        // DateFormat('d MMM').format(DateTime.fromMillisecondsSinceEpoch(dt * 1000))
                        // DateFormat('EEEE').format(DateTime.fromMillisecondsSinceEpoch(dt * 1000))
                        // snapshot.data![0].weather[0].icon
                        // snapshot.data!.first.temp.max;
                        // snapshot.data!.first.temp.min;
                        // snapshot.data![0].humidity;
                        children: snapshot.data!
                            .skip(1)
                            .map(
                              (weekly) => weeklyCard(
                                DateFormat('EEEE').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weekly.dt * 1000)),
                                DateFormat('d MMM').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weekly.dt * 1000)),
                                weekly.weather[0].icon,
                                weekly.temp.max,
                                weekly.temp.min,
                                weekly.humidity,
                              ),
                            )
                            .toList(),
                      ),
                    ],
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
      ),
    );
  }
}
