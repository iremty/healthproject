import 'package:flutter/material.dart';
import 'package:healthproject/global.dart' as global;
import 'package:url_launcher/url_launcher.dart';

class CheckBox_ extends StatefulWidget {
  const CheckBox_({Key? key}) : super(key: key);

  @override
  State<CheckBox_> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox_> {
  // _launchURL() işlevini sınıf düzeyinde tanımla
  _launchURL() async {
    const url = 'https://argenova.com.tr/Stajyer_KVKK_Aydinlatma_Metni.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Link açılamadı: $url';
    }
  }
  _launch2URL() async {
    const url = 'https://akdemiregitim.com/kvkk-acik-riza-ornegi/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Link açılamadı: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          CheckboxListTile(
            title: Text(
              "Aydınlatma Metnini okudum, onayladım.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            checkColor: Colors.white,
            activeColor: Colors.black,
            value: global.durum,
            shape: StadiumBorder(),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? veri) {
              setState(() {
                global.durum = veri!;
                if (veri == true) {
                  _launchURL();
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text(
              "Açık Rıza Beyanını okudum, onayladım.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            checkColor: Colors.white,
            activeColor: Colors.black,
            shape: StadiumBorder(),
            value: global.durum2,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (bool? veri) {
              setState(() {
                global.durum2 = veri!;
                if (veri == true) {
                  _launch2URL();
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
