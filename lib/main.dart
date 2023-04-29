import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main_screen.dart';

List arabic = [];
List malayalam = [];
List quran = [];
List faces = [];
List pages = [];
bool doneRead = false;

Future readJson() async {
  final String response1 =
      await rootBundle.loadString("assets/text/hafs_smart_v8.json");
  final String response2 =
      await rootBundle.loadString("assets/text/faces.json");
  final String response3 =
      await rootBundle.loadString("assets/text/pages.json");
  final data1 = json.decode(response1);
  final data2 = json.decode(response2);
  final data3 = json.decode(response3);
  arabic = data1['quran'];
  faces = data2['faces'];
  pages = data3['pages'];
  //dev.log(faces[0]['rawy'].toString());
  doneRead = true;
  return quran = [arabic];
}

void main() {
  runApp(QaloonWarshApp());
}

class QaloonWarshApp extends StatefulWidget {
  QaloonWarshApp({super.key});

  @override
  State<QaloonWarshApp> createState() => _QaloonWarshAppState();
}

class _QaloonWarshAppState extends State<QaloonWarshApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
      print('done read');

      //await getSettings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(
          // title: 'Flutter Demo Home Page'
          ),
    );
  }
}
