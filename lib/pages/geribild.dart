import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:healthproject/colors.dart";
import 'package:healthproject/global.dart' as global;
import 'package:healthproject/widgets/background_image.dart';

class GeriBildirim extends StatefulWidget {
  const GeriBildirim({super.key});

  @override
  _GeriBildirimState createState() => _GeriBildirimState();
}

class _GeriBildirimState extends State<GeriBildirim> {
  String istekText = '';
  global.DrawerKullanici menu = global.DrawerKullanici();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackGroundImage1(),
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: const Text("Geri Bildirim"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "Geri bildirimleriniz uygulamanın gelişimi için önemli",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.indigo[900]?.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:12.0),
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
              Expanded(child: Container()),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    saveData();
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(fontSize: 20),
                    ),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black45),
                  ),
                  child: Text('Kaydet'),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                menu.buildHeader(context),
                menu.buildMenuItems(context)
              ],
            ),
          ),
        ),
      )
    ]);
  }

  void saveData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('istekOneri').add({
      'kullaniciAdi': global.kullaniciAdi,
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
