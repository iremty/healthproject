import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/widgets/background_image.dart';

class Hastalik extends StatefulWidget {
  const Hastalik({super.key});

  @override
  State<Hastalik> createState() => _HastalikState();
}

class _HastalikState extends State<Hastalik> {
  List<DocumentSnapshot> dataList = [];

  List<String> kisi = [];
  List<String> hastalik = [];
  List<String> istek = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference testCollectionRef = firestore.collection('hastalik');

    QuerySnapshot snapshot = await testCollectionRef.get();
    setState(() {
      dataList = snapshot.docs;

      for (int a = 0; a < dataList.length; a++) {
        var map = dataList[a].data() as Map<String, dynamic>;
        String hastalikk = map['hastalik'];
        String istekk = map['istek'];
        String kAdi = map['kullaniciAdi'];
        kisi.add(kAdi);
        hastalik.add(hastalikk);
        istek.add(istekk);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo[900],
            title: const Text("Kronik Hastalıklar"),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              BackGroundImage1(),
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(5),
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Color(0xffb1a237b), width: 5)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Text(
                                                        'Kullanıcı:  ${kisi[index]} ',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors
                                                              .indigo[900],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          width: 800,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Text(
                                                        'Hastalıkları:  ${hastalik[index]}',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors
                                                              .indigo[900],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          width: 800,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Text(
                                                        'Çözüm Önerisi:  ${istek[index]}',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors
                                                              .indigo[900],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          width: 800,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xffb1a237b)),
                                      onPressed: () async {
                                        await dataList[index]
                                            .reference
                                            .delete();
                                        kisi.clear();
                                        hastalik.clear();
                                        istek.clear();
                                        dataList.clear();
                                        fetchData();
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Çözüldü',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
