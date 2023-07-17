import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/pages/test.dart';

import 'admin_page.dart';
import 'etkinlik.dart';

class SonucClass extends StatefulWidget {
  const SonucClass({super.key});

  @override
  State<SonucClass> createState() => _SonucClassState();
}

class _SonucClassState extends State<SonucClass> {
  List<String> sorular = [];
  List<DocumentSnapshot> dataList = [];

  List<SoruCevap> cevaplar = [];
  List<DocumentSnapshot> dataList2 = [];

  List<ortalamalar> ortalamaCevaplar = [];

  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference testCollectionRef = firestore.collection('sorular');

    CollectionReference cevapCollectionRef = firestore.collection('cevaplar');

    QuerySnapshot snapshot = await testCollectionRef.get();
    QuerySnapshot snapshot2 = await cevapCollectionRef.get();
    setState(() {
      dataList = snapshot.docs;
      dataList2 = snapshot2.docs;

      for (int a = 0; a < dataList.length; a++) {
        var map = dataList[a].data() as Map<String, dynamic>;
        String soru = map['soru'];
        sorular.add(soru);
      }
      for (int a = 0; a < dataList2.length; a++) {
        var map = dataList2[a].data() as Map<String, dynamic>;
        int soruNo = map['soruNo'];
        int puan = map['puan'];
        cevaplar.add(SoruCevap(soruNo, puan));
      }
      for (int i = 0; i < cevaplar.length; i++) {
        print('soru: ${cevaplar[i].soru} - cevap: ${cevaplar[i].cevap}');
      }
      for (int k = 0; k < sorular.length; k++) {
        ortalamaCevaplar.add(ortalamalar(0));
      }

      for (int i = 0; i < sorular.length; i++) {
        for (int j = 0; j < cevaplar.length; j++) {
          if (i + 1 == cevaplar[j].soru) {
            ortalamaCevaplar[i].ort += cevaplar[j].cevap;
          }
        }
      }
      for (int i = 0; i < ortalamaCevaplar.length; i++) {
        ortalamaCevaplar[i].ort /= (cevaplar.length / sorular.length);
      }

      for (int a = 0; a < ortalamaCevaplar.length; a++) {
        print('${a} - ${ortalamaCevaplar[a].ort}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Anket Sonuçları'),
          backgroundColor: Colors.blue[900],
        ),
        body: Stack(children: [
          Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.blue[900]!,
                          width: 3.0,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Soru',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.blue[900]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Puan',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.blue[900]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(5),
                    itemCount: sorular.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: index % 2 == 0
                                  ? Colors.blue[900]
                                  : Colors.indigo[100],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          '${sorular[index]}',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: index % 2 == 0
                                                ? Colors.white
                                                : Colors.indigo[900],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 15, 15),
                                      child: Text(
                                        ' ${ortalamaCevaplar[index].ort.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: index % 2 == 0
                                              ? Colors.white
                                              : Colors.indigo[900],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            width: 800,
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ]),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [buildHeader(context), buildMenuItems(context)],
            ),
          ),
        ),
      ),
    );
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
            title: const Text('Anket Sonuçları'),
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

class ortalamalar {
  ortalamalar(this.ort);
  double ort = 0;
}
