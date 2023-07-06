import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:healthproject/colors.dart";
import 'package:healthproject/pages/test.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: const Text("Hastalıklarınız"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "Hastalıklarınız nelerdir?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo[900]?.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      hastalikText = val;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    hintStyle: kBodyText,
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "Şirketten, bu konuda beklentileriniz nelerdir?",
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
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      istekText = val;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    hintStyle: kBodyText,
                  ),
                  style: TextStyle(color: Colors.black),
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
                  context, MaterialPageRoute(builder: (context) => Kronik()));
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
