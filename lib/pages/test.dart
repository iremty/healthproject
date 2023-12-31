import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/global.dart' as global;
import 'package:healthproject/pages/first_page.dart';
import 'package:healthproject/widgets/background_image.dart';

import 'diseases.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _RadState createState() => _RadState();
}

class _RadState extends State<Test> {
  List<DocumentSnapshot> dataList = [];

  List<String> sorular = [];
  List<SoruCevap> sorucevap = [];
  global.DrawerKullanici menu = global.DrawerKullanici();
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference testCollectionRef = firestore.collection('sorular');

    QuerySnapshot snapshot = await testCollectionRef.get();
    setState(() {
      dataList = snapshot.docs;

      for (int i = 0; i < dataList.length; i++) {
        sorucevap.add(SoruCevap(i + 1, 3));
      }

      for (int a = 0; a < dataList.length; a++) {
        var map = dataList[a].data() as Map<String, dynamic>;
        String soru = map['soru'];
        sorular.add(soru);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: const Text("Haftalık Anket"),
      ),
      body: Stack(
        children: [
          //BackGroundImage1(),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.transparent,
                      //color: Colors.green,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 26,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 4),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(

                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(7, 2, 7, 5),
                                      child: Column(
                                        children: [
                                          Text(
                                            sorular[index],
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            thickness: 1.00000001,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    buildRadio(index, 1),
                                    buildText("1"),
                                    buildSizedBox(),
                                    buildRadio(index, 2),
                                    buildText("2"),
                                    buildSizedBox(),
                                    buildRadio(index, 3),
                                    buildText("3"),
                                    buildSizedBox(),
                                    buildRadio(index, 4),
                                    buildText("4"),
                                    buildSizedBox(),
                                    buildRadio(index, 5),
                                    buildText("5"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 2)),
                    minimumSize: Size(200, 40),
                    backgroundColor: Colors.white),
                onPressed: () {
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  CollectionReference cevaplarBase =
                      firestore.collection('cevaplar');
                  for (int i = 0; i < sorucevap.length; i++) {
                    print(
                        'soru:${sorucevap[i].soru} cevap:${sorucevap[i].cevap}');
                  }
                  for (int i = 0; i < sorucevap.length; i++) {
                    cevaplarBase.add({
                      'soruNo': sorucevap[i].soru,
                      'kullaniciAdi': global.kullaniciAdi,
                      'puan': sorucevap[i].cevap
                    });
                  }
                },
                child: const Text(
                  "Kaydet",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.blue[900],
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

  SizedBox buildSizedBox() {
    return const SizedBox(
      width: 20,
    );
  }

  Text buildText(String a) {
    return Text(
      a,
      style: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  Radio<int> buildRadio(int index, int x) {
    return Radio(
        value: x,
        groupValue: sorucevap[index].cevap,
        onChanged: (value) {
          setState(() {
            sorucevap[index].cevap = value!;
          });
        });
  }
}

class SoruCevap {
  SoruCevap(this.soru, this.cevap);
  int soru;
  int cevap;
}
