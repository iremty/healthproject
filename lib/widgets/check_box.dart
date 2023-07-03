import 'package:flutter/material.dart';

class CheckBox_ extends StatefulWidget {
  const CheckBox_({super.key});

  @override
  State<CheckBox_> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox_> {
  bool durum=false;
  bool durum2=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.transparent,
      body:
    Column( children: [

      CheckboxListTile(title: Text("Aydınlatma Metnini okudum, onayladım.",),
          checkColor: Colors.white,
          activeColor: Colors.black,
          tileColor: Colors.grey[600]?.withOpacity(0.5),
          value: durum,
          shape: StadiumBorder(),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged:(bool? veri ){setState(() {
            durum=veri!;
          });}),

      CheckboxListTile(title: Text("Açık Rıza Beyanını okudum, onayladım."),
          checkColor: Colors.white,
          activeColor: Colors.black,
          tileColor: Colors.grey[600]?.withOpacity(0.5),
          shape: StadiumBorder(),
          value: durum2,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged:(bool? veri ){setState(() {
            durum2=veri!;
          });})
  ],),);
  }
}


