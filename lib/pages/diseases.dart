import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:healthproject/colors.dart";
import 'package:healthproject/pages/test.dart';
import 'package:healthproject/widgets/background_image.dart';
import 'first_page.dart';
import 'package:healthproject/global.dart' as global;

class Kronik extends StatefulWidget {
  const Kronik({super.key});

  @override
  _KronikState createState() => _KronikState();
}

class _KronikState extends State<Kronik> {
  String hastalikText = '';
  String istekText = '';
  global.DrawerKullanici menu = global.DrawerKullanici();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: const Text("Hastalıklarınız"),
      ),
      body: Stack(
        children: [
          BackGroundImage9(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
            child: Column(
              children: [
                SizedBox(height: 78),
                Text(
                  "Hastalıklarınız nelerdir?",
                  style: TextStyle(
                    //backgroundColor: Colors.blue[100]?.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo[900]?.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextFormField(
                      maxLines: null,
                      onChanged: (val) {
                        setState(() {
                          hastalikText = val;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        border: InputBorder.none,
                        hintStyle: kBodyText,
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Şirketten, bu konuda beklentileriniz nelerdir?",
                    style: TextStyle(
                      //backgroundColor: Colors.blue[100]?.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.0),
                  child: Container(
                    height: 165,
                    decoration: BoxDecoration(
                      color: Colors.indigo[900]?.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() {
                            istekText = val;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          border: InputBorder.none,
                          hintStyle: kBodyText,
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      saveData();
                    },
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(
                          fontSize: 20,

                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue[900]!),
                    ),
                    child: Text('Kaydet'),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
      //backgroundColor: Colors.transparent,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [menu.buildHeader(context), menu.buildMenuItems(context)],
          ),
        ),
      ),
    );
  }

  void saveData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('hastalik').add({
      'kullaniciAdi': global.kullaniciAdi,
      'hastalik': hastalikText,
      'istek': istekText,
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Veriler Kaydedildi'),
          content: Text('Girilen veriler Şirket\'e gönerildi.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}
