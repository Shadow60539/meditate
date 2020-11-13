import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoga_flutter/home/pages/index_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yoga',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IndexPage(),
    );
  }
}
