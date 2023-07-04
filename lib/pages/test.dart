import 'package:flutter/material.dart';
import 'package:healthproject/colors.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}
class _TestState extends State<Test> {
  int groupValue = 1;
  late int list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("SORULAR"),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 200),
        child: Center(
          child: Column(
            children: [
              buildText("Can Chennai Super King Win IPL 2023 ?",),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    buildRadio(1),
                    buildText("1"),
                    buildRadio(2),
                    buildText("2"),
                    buildRadio(3),
                    buildText("3"),
                    buildRadio(4),
                    buildText("4"),
                    buildRadio(5),
                    buildText("5"),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
             Expanded(child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 ElevatedButton(
                   onPressed: () {},
                   child: buildText("Geri",),
                 ),
          ElevatedButton(
            onPressed: () {},
            child: buildText("İleri",),
          ),

               ],))
            ],
          ),
        ),
      ),
    );
  }
  Text buildText(String text) {
    return Text(
      text,
      style:TextStyle(fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,)
    );
  }
  Radio buildRadio(int x) {
    return Radio(
      value: x,
      groupValue: groupValue,
      onChanged: (value) {
        setState(() {
          groupValue = x;
        });
      },
    );
  }
}
