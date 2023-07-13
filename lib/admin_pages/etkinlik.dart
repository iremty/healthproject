import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/admin_pages/test_sonuc.dart';
import 'package:healthproject/global.dart' as global;
import 'package:healthproject/widgets/background_image.dart';
import 'package:image_picker/image_picker.dart';

import '../colors.dart';
import 'admin_page.dart';

class Etkinlik extends StatefulWidget {
  const Etkinlik({super.key});

  @override
  _EtkinlikState createState() => _EtkinlikState();
}

class _EtkinlikState extends State<Etkinlik> {
  XFile? _secilenResim;
  String etkAdi = 'bos';
  String aciklama = 'bos';
  global.DrawerKullanici menu = global.DrawerKullanici();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackGroundImage1(),
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: const Text("Etkinlik Ekle"),
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xffb1a237b), width: 5)),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo[900]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          maxLines: null,
                          onChanged: (val) {
                            setState(() {
                              etkAdi = val;
                            });
                          },
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                              hintStyle: kBodyText,
                              hintText: 'Etkinlik Adı'),
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo[900]?.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          maxLines: null,
                          onChanged: (val) {
                            setState(() {
                              aciklama = val;
                            });
                          },
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 20),
                              border: InputBorder.none,
                              hintStyle: kBodyText,
                              hintText: 'Açıklama'),
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      onPressed: galeriden_yukleme,
                      child: Text(
                        'Galeriden Seç',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                  ElevatedButton(
                      onPressed: kameradan_yukleme,
                      child: Text(
                        'Fotoğraf Çek',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                  _secilenResim == null
                      ? Text(
                    "Resim yok",
                    style: TextStyle(fontSize: 40),
                  )
                      : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(File(_secilenResim!.path)),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: sisteme_yukleme,
                      child: Text(
                        'Ekle',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [buildHeader(context), buildMenuItems(context)],
            ),
          ),
        ),
      )
    ]);
  }

  void galeriden_yukleme() async {
    final ImagePicker picker = ImagePicker();
    var resim = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _secilenResim = resim;
    });
  }

  void kameradan_yukleme() async {
    final ImagePicker picker = ImagePicker();
    var resim = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _secilenResim = resim;
    });
  }

  void sisteme_yukleme() async {
    if (etkAdi == 'bos' || aciklama == 'bos' || _secilenResim == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Eksik veri'),
        ),
      );
    } else {
      Reference ref = FirebaseStorage.instance
          .ref("etkinlikler")
          .child("etkinlik_resimleri")
          .child("${etkAdi}.png");

      File file = File(_secilenResim!.path);
      UploadTask task = ref.putFile(file);

      var snapshot = await task.whenComplete(() {});
      var url = await ref.getDownloadURL();
      print("url = " + url);

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore
          .collection('etkinlikler')
          .add({'etkAd': etkAdi, 'url': url, 'aciklama': aciklama});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Etkinlik Sisteme Eklendi.'),
        ),
      );
    }
  }

  Widget buildHeader(BuildContext context) => Container(
    color: Colors.indigo[900],
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/m.jpg'),
          radius: 80,
        ),
        SizedBox(
          height: 20,
        )
      ],
    ),
  );

  Widget buildMenuItems(BuildContext context) => Column(
    children: [
      ListTile(
        leading: Icon(Icons.home_outlined),
        title: Text('Anasayfa'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdminMenu()));
        },
      ),
      buildDivider(),
      ListTile(
        leading: const Icon(Icons.pending_actions),
        title: const Text('Test Sonuçları'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SonucClass()));
        },
      ),
      buildDivider(),
      ListTile(
        leading: const Icon(Icons.celebration),
        title: const Text('Etkinlikler'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Etkinlik()));
        },
      ),
      buildDivider(),
      ListTile(
        leading: const Icon(Icons.exit_to_app),
        title: const Text('Çıkış'),
        onTap: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      ),
      buildDivider(),
    ],
  );

  Divider buildDivider() {
    return Divider(
      height: 10,
      thickness: 1,
    );
  }
}