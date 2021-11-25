import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          ListTile(
            leading: FlutterLogo(),
            title: Text('This app is developed using Flutter by Soffan.'),
            subtitle: Text("version 1.0.0"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Source code on GitHub'),
            onTap: () {
              launch("https://github.com/soffandluffy/tamdp_weatherapp");
            },
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('soffanma@gmail.com'),
            onTap: () {
              // launch(github_url);
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('0821 - 1361 - 3388'),
            onTap: () {
              // launch(github_url);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.blue,
            ),
            title: Text(
              'Made for final project Mobile Device Programming',
              style: TextStyle(color: Colors.black54, fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
