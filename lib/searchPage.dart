import 'package:flutter/material.dart';
import 'main.dart';



class searchPage extends StatefulWidget {
  searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  TextEditingController? txtController=TextEditingController();

  var foundTexts=[];

  String searchString='الكتاب';
  Color myColor=Colors.cyan;

  List<Widget> wList=[Text('first')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children : [TextField(
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                controller: txtController,

              ),SizedBox(height: 20,),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_outlined)),SizedBox(width: 40,),
                    TextButton(onPressed: (){
                      print(searchString);

                      if(txtController!=null) {
                        searchString=txtController!.text;
                        wList.clear();
                        arabic.forEach((element) {
                          String ayatext=element['aya_text_emlaey'];
                          if(ayatext.contains(searchString)==true){
                            if (myColor==Colors.cyan){myColor=Colors.blue;}else{myColor=Colors.cyan;}
                            foundTexts.add(ayatext);
                            wList.add( Container(
                              padding: EdgeInsets.all(5),
                              color: myColor,
                              child: Text(ayatext,
                                style: TextStyle(
                                  fontSize: 20
                                ),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,

                              ),
                            ));
                            wList.add(
                             Text(" سورة  ${element['sura_name_ar']}  الآية ${element['aya_no']}     " )
                            );
                            wList.add(Container(height: 10,));
                          }
                         // print(ayatext);
                        });

                        //foundTexts=arabic.where((element) => normalise( element['aya_text_emlaey'].toString()).contains(normalise(searchString))).toList();


                        print(txtController!.text);
                        print(foundTexts.length);
                        print(foundTexts);
                        print('search complete');
                      }
                    setState(() {
                      print('done search');
                    });
                    }
                        ,
                        child: Text('Search Quran')

                    ),
                  ],
                ),

                SizedBox(height: 20,),

                SingleChildScrollView(
                  child: Column(
                    children: wList
                  ) ,
                )

              ]
            ),
          ),
        ),
      ),
    );
  }
}

String normalise(String input) => input
    .replaceAll('\u0610', '') //ARABIC SIGN SALLALLAHOU ALAYHE WA SALLAM
    .replaceAll('\u0611', '') //ARABIC SIGN ALAYHE ASSALLAM
    .replaceAll('\u0612', '') //ARABIC SIGN RAHMATULLAH ALAYHE
    .replaceAll('\u0613', '') //ARABIC SIGN RADI ALLAHOU ANHU
    .replaceAll('\u0614', '') //ARABIC SIGN TAKHALLUS

//Remove koranic anotation
    .replaceAll('\u0615', '') //ARABIC SMALL HIGH TAH
    .replaceAll(
    '\u0616', '') //ARABIC SMALL HIGH LIGATURE ALEF WITH LAM WITH YEH
    .replaceAll('\u0617', '') //ARABIC SMALL HIGH ZAIN
    .replaceAll('\u0618', '') //ARABIC SMALL FATHA
    .replaceAll('\u0619', '') //ARABIC SMALL DAMMA
    .replaceAll('\u061A', '') //ARABIC SMALL KASRA
    .replaceAll('\u06D6',
    '') //ARABIC SMALL HIGH LIGATURE SAD WITH LAM WITH ALEF MAKSURA
    .replaceAll('\u06D7',
    '') //ARABIC SMALL HIGH LIGATURE QAF WITH LAM WITH ALEF MAKSURA
    .replaceAll('\u06D8', '') //ARABIC SMALL HIGH MEEM INITIAL FORM
    .replaceAll('\u06D9', '') //ARABIC SMALL HIGH LAM ALEF
    .replaceAll('\u06DA', '') //ARABIC SMALL HIGH JEEM
    .replaceAll('\u06DB', '') //ARABIC SMALL HIGH THREE DOTS
    .replaceAll('\u06DC', '') //ARABIC SMALL HIGH SEEN
    .replaceAll('\u06DD', '') //ARABIC END OF AYAH
    .replaceAll('\u06DE', '') //ARABIC START OF RUB EL HIZB
    .replaceAll('\u06DF', '') //ARABIC SMALL HIGH ROUNDED ZERO
    .replaceAll('\u06E0', '') //ARABIC SMALL HIGH UPRIGHT RECTANGULAR ZERO
    .replaceAll('\u06E1', '') //ARABIC SMALL HIGH DOTLESS HEAD OF KHAH
    .replaceAll('\u06E2', '') //ARABIC SMALL HIGH MEEM ISOLATED FORM
    .replaceAll('\u06E3', '') //ARABIC SMALL LOW SEEN
    .replaceAll('\u06E4', '') //ARABIC SMALL HIGH MADDA
    .replaceAll('\u06E5', '') //ARABIC SMALL WAW
    .replaceAll('\u06E6', '') //ARABIC SMALL YEH
    .replaceAll('\u06E7', '') //ARABIC SMALL HIGH YEH
    .replaceAll('\u06E8', '') //ARABIC SMALL HIGH NOON
    .replaceAll('\u06E9', '') //ARABIC PLACE OF SAJDAH
    .replaceAll('\u06EA', '') //ARABIC EMPTY CENTRE LOW STOP
    .replaceAll('\u06EB', '') //ARABIC EMPTY CENTRE HIGH STOP
    .replaceAll('\u06EC', '') //ARABIC ROUNDED HIGH STOP WITH FILLED CENTRE
    .replaceAll('\u06ED', '') //ARABIC SMALL LOW MEEM

//Remove tatweel
    .replaceAll('\u0640', '')

//Remove tashkeel
    .replaceAll('\u064B', '') //ARABIC FATHATAN
    .replaceAll('\u064C', '') //ARABIC DAMMATAN
    .replaceAll('\u064D', '') //ARABIC KASRATAN
    .replaceAll('\u064E', '') //ARABIC FATHA
    .replaceAll('\u064F', '') //ARABIC DAMMA
    .replaceAll('\u0650', '') //ARABIC KASRA
    .replaceAll('\u0651', '') //ARABIC SHADDA
    .replaceAll('\u0652', '') //ARABIC SUKUN
    .replaceAll('\u0653', '') //ARABIC MADDAH ABOVE
    .replaceAll('\u0654', '') //ARABIC HAMZA ABOVE
    .replaceAll('\u0655', '') //ARABIC HAMZA BELOW
    .replaceAll('\u0656', '') //ARABIC SUBSCRIPT ALEF
    .replaceAll('\u0657', '') //ARABIC INVERTED DAMMA
    .replaceAll('\u0658', '') //ARABIC MARK NOON GHUNNA
    .replaceAll('\u0659', '') //ARABIC ZWARAKAY
    .replaceAll('\u065A', '') //ARABIC VOWEL SIGN SMALL V ABOVE
    .replaceAll('\u065B', '') //ARABIC VOWEL SIGN INVERTED SMALL V ABOVE
    .replaceAll('\u065C', '') //ARABIC VOWEL SIGN DOT BELOW
    .replaceAll('\u065D', '') //ARABIC REVERSED DAMMA
    .replaceAll('\u065E', '') //ARABIC FATHA WITH TWO DOTS
    .replaceAll('\u065F', '') //ARABIC WAVY HAMZA BELOW
    .replaceAll('\u0670', '') //ARABIC LETTER SUPERSCRIPT ALEF

//Replace Waw Hamza Above by Waw
    .replaceAll('\u0624', '\u0648')

//Replace Ta Marbuta by Ha
    .replaceAll('\u0629', '\u0647')

//Replace Ya
// and Ya Hamza Above by Alif Maksura
    .replaceAll('\u064A', '\u0649')
    .replaceAll('\u0626', '\u0649')

// Replace Alifs with Hamza Above/Below
// and with Madda Above by Alif
    .replaceAll('\u0622', '\u0627')
    .replaceAll('\u0623', '\u0627')
    .replaceAll('\u0625', '\u0627');
