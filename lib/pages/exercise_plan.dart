import 'package:flutter/material.dart';

class ExercisePlanPage extends StatelessWidget {
  final String title;
  final List<String> plans;
  final List<String> imagePaths;
  final List<String> planTitles;

  ExercisePlanPage({
    required this.title,
    required this.plans,
    required this.imagePaths,
    required this.planTitles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(title),
          elevation: 0,
        ),
        backgroundColor: Colors.blue[900],
        body: Stack(children: [
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
                      planTitles[index],
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0),
                    Divider(
                      color: Colors.white.withOpacity(1),
                      thickness: 0.5,
                      height: 50,
                    ),
                    Text(
                      plans[index],
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ]));
  }
}
