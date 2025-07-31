import 'package:facebook_clone/utilities/palette.dart';
import 'package:facebook_clone/views/views.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter facebook UI',
      theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          visualDensity: VisualDensity.adaptivePlatformDensity,primarySwatch: Colors.blue),
      home: Navscreen(),
    );
  }
}
