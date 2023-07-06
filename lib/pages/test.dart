import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/global.dart' as global;
import 'package:healthproject/pages/first_page.dart';

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
        title: const Text("Haftalık Test"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white70,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(5),
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.transparent,
                      //color: Colors.green,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            sorular[index],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
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
                          Divider(
                            height: 10,
                            color: Colors.blueGrey,
                            thickness: 2,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
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
              )
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [buildHeader(context), buildMenuItems(context)],
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
              MaterialPageRoute(builder: (context) => FirstPage()));
        },
      ),
      buildDivider(),
      ListTile(
        leading: const Icon(Icons.pending_actions),
        title: const Text('Test'),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Test()));
        },
      ),
      buildDivider(),
      ListTile(
        leading: const Icon(Icons.vaccines),
        title: const Text('İlaç Takip'),
        onTap: () {},
      ),
      buildDivider(),
      ListTile(
        leading: const Icon(Icons.sports_gymnastics),
        title: const Text('Egzersiz'),
        onTap: () {},
      ),
      buildDivider(),
      ListTile(
        leading: const Icon(Icons.monitor_heart),
        title: const Text('Kronik Hastalıklar'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Kronik()));
        },
      ),
      buildDivider(),
      ListTile(
        leading: const Icon(Icons.mail),
        title: const Text('Geri Bildirim'),
        onTap: () {},
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

class SoruCevap {
  SoruCevap(this.soru, this.cevap);
  int soru;
  int cevap;
}
