import 'package:flutter/material.dart';
import 'package:healthproject/global.dart' as global;

class CheckBox_ extends StatefulWidget {
  const CheckBox_({Key? key}) : super(key: key);

  @override
  State<CheckBox_> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox_> {
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
                });
              }),
          CheckboxListTile(
              title: Text("Açık Rıza Beyanını okudum, onayladım.", style: TextStyle(fontWeight: FontWeight.bold),),
              checkColor: Colors.white,
              activeColor: Colors.black,
              shape: StadiumBorder(),
              value: global.durum2,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? veri) {
                setState(() {
                  global.durum2 = veri!;
                });
              }),
        ],
      ),
    );
  }
}