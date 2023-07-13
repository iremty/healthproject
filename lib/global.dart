library healthproject.global;

import 'package:flutter/material.dart';
import 'package:healthproject/admin_pages/etkinlik.dart';
import 'package:healthproject/pages/diseases.dart';
import 'package:healthproject/pages/etkinlik_kullanici.dart';
import 'package:healthproject/pages/exercise.dart';
import 'package:healthproject/pages/first_page.dart';
import 'package:healthproject/pages/geribild.dart';
import 'package:healthproject/pages/medicine.dart';
import 'package:healthproject/pages/stress.dart';
import 'package:healthproject/pages/test.dart';

String kullaniciAdi = 'tmp@hotmail.com';
bool durum = false;
bool durum2 = false;

class DrawerKullanici {
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
            title: const Text('Anket'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Test()));
            },
          ),
          buildDivider(),
          ListTile(
            leading: const Icon(Icons.vaccines),
            title: const Text('İlaç Takip'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Medicine()));
            },
          ),
          buildDivider(),
          ListTile(
            leading: const Icon(Icons.sports_gymnastics),
            title: const Text('Egzersiz'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Exercise()));
            },
          ),
          buildDivider(),
          ListTile(
            leading: const Icon(Icons.nature_people_rounded),
            title: const Text('Stres Yönetimi'),
            onTap: () { Navigator.push(
                context, MaterialPageRoute(builder: (context) => Stress()));},
          ),
          buildDivider(),
          ListTile(
            leading: const Icon(Icons.monitor_heart),
            title: const Text(' Hastalıklar'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Kronik()));
            },
          ),
          buildDivider(),
          ListTile(
            leading: const Icon(Icons.celebration),
            title: const Text(' Etkinlikler'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => etkKullanici()));
            },
          ),
          buildDivider(),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Geri Bildirim'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GeriBildirim()));
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

// TODO Implement this library.
