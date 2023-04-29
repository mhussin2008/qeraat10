import 'dart:async';

import 'package:flutter/material.dart';
import 'arabic_number_converter.dart';
import 'main.dart';
import 'qatra_page.dart';
import 'faces_page.dart';
import 'index_data.dart';
import 'sura_names.dart';
// import 'package:zoom_widget/zoom_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    // required this.title
  });
  // final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String Qaloon_path = 'assets/qaloon/Kaloon- ';
  String Warsh_path = 'assets/warsh/warsh- ';
  String Qaloon_title = 'assets/frames/qaloon.jpg';
  String Warsh_title = 'assets/frames/warsh.jpg';
  String current_title = 'assets/frames/qaloon.jpg';
  int surah = 0;
  int ayah = 0;

  bool rewaya = true;
  String current_rewaya = 'assets/qaloon/Kaloon- ';
  int pageNumber = 1;
  var dropdownvalue = '';
  //List<String> ayaList=['إختر رقم الآية','البقرة   5','الأنفال   6','7','8'];
  var pagedata = [];

  var checkValue = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(pagedata[1]['aya_no'].toString());
    //pagedata.map((e) => print(e['aya_no'].toString()));

    if (doneRead == true) {
      pagedata =
          arabic.where((element) => element['page'] == pageNumber).toList();
      print(pagedata);
      //print(pagedata[0]['sura_no']);
      surah = pagedata[0]['sura_no'];
      print('sura ==$surah');
      print(pagedata.length);
      print(pagedata[0]);
      dropdownvalue = pagedata[0]['aya_no'].toString();
      print('dropdownvalue =$dropdownvalue');
      List<DropdownMenuItem<String>>? dropdownlist = [];

      pagedata.forEach((element) {
        int newaya = element['aya_no'];
        dropdownlist.add(DropdownMenuItem(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 100,
            child: Text(
              newaya.toString().toArabicNumbers,
              textAlign: TextAlign.right,
            ),
          ),
          value: element['aya_no'].toString(),
        ));
        print(element['aya_no'].toString());
      });

      return Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onTap: () {
                setState(() {
                  rewaya = !rewaya;
                  current_rewaya = rewaya ? Qaloon_path : Warsh_path;
                  current_title = rewaya ? Qaloon_title : Warsh_title;
                });
              },
              child: Image.asset(current_title),
            ),
          ),
          drawer: SafeArea(
            child: Drawer(
                // Add a ListView to the drawer. This ensures the user can scroll
                // through the options in the drawer if there isn't enough vertical
                // space to fit everything.
                child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: suraNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Text(' ${suraPageNum[index].toArabicNumbers}'),
                                Expanded(
                                    child: SizedBox(
                                        child: Text(
                                  suraNames[index],
                                  textAlign: TextAlign.right,
                                ))),
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              pageNumber = suraPageNum[index];
                              //privacy=true;
                              // _makeFileName();
                            });
                            Navigator.pop(context);
                          });
                    })),
          ),
          body: SafeArea(
            child: Column(children: [
              GestureDetector(
                onTap: () {
                  print('tapped');
                },
                onTapUp: (dsd) {
                  print('tap up');
                  print('${dsd.globalPosition.dx}  ${dsd.localPosition.dx}');
                  print('${dsd.globalPosition.dy}  ${dsd.localPosition.dy}');
                },
                child: InteractiveViewer(
                    panEnabled: false,
                    child: Image.asset(
                      '$current_rewaya($pageNumber).jpg',
                    )),
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [Text('مقاطع صوتية'),
                   Checkbox(
                      value: checkValue,
                      onChanged: (value) {
                        setState(() {
                          checkValue = value!;
                        });
                      }),
                 ],
               ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      iconSize: 40,
                      icon: Image.asset('assets/icons/icons8-left-94.png'),
                      onPressed: () {
                        _pageGoForword();
                      })
                  // ,SizedBox(width: 40,)
                  ,

                  //drop down list
                  DropdownButton(
                      alignment: AlignmentDirectional.centerEnd,
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: dropdownlist,
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (var t) {
                        setState(() {
                          ayah = int.parse(t.toString());
                          print(t.toString());
                          dropdownvalue = t.toString().toArabicNumbers;
                          var yyy = faces.where((element) =>
                              element['surah'] == surah &&
                              element['aya'] == ayah);

                          if (yyy.isNotEmpty == true) {
                            if (checkValue == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => facesPage(
                                            surah: surah,
                                            aya: ayah,
                                          )));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => facesPage(
                                            surah: surah,
                                            aya: ayah,
                                          )));
                            }
                          }

//dev.log('surah '+(widget.surah+1).toString() +' aya '+(index+1).toString());
                        });
                      })

                  //   ,Expanded(
                  //     child: IconButton(onPressed: (){
                  //       var pagedata=arabic.where((element) => element['page']==3);
                  //       print (pagedata);
                  //       },
                  //       icon: Icon(Icons.account_balance
                  //
                  //       )
                  // ),
                  //   )
                  ,
                  Text('إختر رقم الآية '),

                  IconButton(
                      iconSize: 40,
                      icon: Image.asset('assets/icons/icons8-right-94.png'),
                      onPressed: () {
                        _pageGoBack();
                      })
                  //,SizedBox(width: 40,),
                ],
              )
            ]),
          ));
    } else {
      Timer t = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (doneRead == true) {
          timer.cancel();
        }
        setState(() {
          print('setstate called');
        });
      });

      print('still loading');
      return SafeArea(child: Text('Loading'));
    }
  }

  void _pageGoBack() {
    if (pageNumber < 2) {
      return;
    }
    setState(() {
      pageNumber--;
      //_makeFileName();
    });
  }

  void _pageGoForword() {
    if (pageNumber > 603) {
      return;
    }
    setState(() {
      pageNumber++;
      //_makeFileName();
    });
  }
}
