import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/global.dart' as global;

class etkKullanici extends StatefulWidget {
  const etkKullanici({super.key});

  @override
  _RadState createState() => _RadState();
}

class _RadState extends State<etkKullanici> {
  List<DocumentSnapshot> dataList = [];

  List<String> etkAd = [];
  List<String> aciklama = [];
  List<String> fotolar = [];

  global.DrawerKullanici menu = global.DrawerKullanici();
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference testCollectionRef = firestore.collection('etkinlikler');

    QuerySnapshot snapshot = await testCollectionRef.get();
    setState(() {
      dataList = snapshot.docs;

      for (int a = 0; a < dataList.length; a++) {
        var map = dataList[a].data() as Map<String, dynamic>;
        String _etkAd = map['etkAd'];
        String _aciklama = map['aciklama'];
        String _url = map['url'];

        etkAd.add(_etkAd);
        aciklama.add(_aciklama);
        fotolar.add(_url);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Etkinlikler"),
        elevation: 0,
      ),
      body: Stack(
        children: [
          //BackGroundImage1(),
          Column(
            children: [
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
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white54,
                                    ),
                                    width: 400,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 2, 0, 20),
                                          child: Image.network(
                                            fotolar[index],
                                          ),
                                        ),
                                        Text(
                                          '${etkAd[index]}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 15, 20),
                                          child: Text(
                                            '${aciklama[index]}',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
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
}
