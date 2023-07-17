import 'package:flutter/material.dart';
import 'package:healthproject/widgets/background_image.dart';

class ExercisePlanPage extends StatelessWidget {
  final String title;
  final List<String> plans;
  final List<String> imagePaths;

  ExercisePlanPage({
    required this.title,
    required this.plans,
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(title),
        ),
        body: Stack(children: [
          BackGroundImage1(),
          PageView.builder(
            itemCount: plans.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePaths[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'EGZERSİZ PLANI - ${index + 1}',
                      semanticsLabel: plans[index],
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0),
                    Divider(
                      color: Colors.blueGrey.withOpacity(1),
                      thickness: 3,
                      height: 50,
                    ),
                    Text(
                      plans[index],
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              );
            },
          ),
        ]));
  }
}
