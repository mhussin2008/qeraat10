import 'package:flutter/material.dart';
import 'arabic_number_converter.dart';
import 'sura_names.dart';

class qatraPage extends StatelessWidget {
  final surah;

  final aya;

   qatraPage({Key? key, this.surah, this.aya}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var suraName = arabicName[surah - 1]['name'];
    var ayanumber = aya.toString().toArabicNumbers;
    var t = ' أوجه الآية  ${ayanumber} من سورة $suraName ';
    return  Scaffold(
        appBar: AppBar(
          title: Center(child: Text(t)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: Center(child: Image.asset('assets/qatra/qatra-$surah-$aya.jpg'),));
  }
}
