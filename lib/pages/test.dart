import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/global.dart' as global;

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  _RadState createState() => _RadState();
}

class _RadState extends State<RadioButton> {
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
        title: const Text("Haftalık Test"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/login.jpeg"),
                    fit: BoxFit.cover,
                    colorFilter:
                    ColorFilter.mode(Colors.black45, BlendMode.darken))),
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
                              Radio(
                                  value: 1,
                                  groupValue: sorucevap[index].cevap,
                                  onChanged: (value) {
                                    setState(() {
                                      sorucevap[index].cevap = value!;
                                    });
                                  }),
                              const Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Radio(
                                  value: 2,
                                  groupValue: sorucevap[index].cevap,
                                  onChanged: (value) {
                                    setState(() {
                                      sorucevap[index].cevap = value!;
                                    });
                                  }),
                              const Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Radio(
                                  value: 3,
                                  groupValue: sorucevap[index].cevap,
                                  onChanged: (value) {
                                    setState(() {
                                      sorucevap[index].cevap = value!;
                                    });
                                  }),
                              const Text(
                                "3",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Radio(
                                  value: 4,
                                  groupValue: sorucevap[index].cevap,
                                  onChanged: (value) {
                                    setState(() {
                                      sorucevap[index].cevap = value!;
                                    });
                                  }),
                              const Text(
                                "4",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Radio(
                                  value: 5,
                                  groupValue: sorucevap[index].cevap,
                                  onChanged: (value) {
                                    setState(() {
                                      sorucevap[index].cevap = value!;
                                    });
                                  }),
                              const Text(
                                "5",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(
                            height: 10,
                            color: Colors.cyan,
                            thickness: 3,
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
    );
  }
}

class SoruCevap {
  SoruCevap(this.soru, this.cevap);
  int soru;
  int cevap;
}