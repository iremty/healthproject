import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/aa.png"),
        fit: BoxFit.cover,
      )),
    );
  }
}
class BackGroundImage1 extends StatelessWidget {
  const BackGroundImage1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/1.png"),
            fit: BoxFit.cover,
          )),
    );
  }
}
