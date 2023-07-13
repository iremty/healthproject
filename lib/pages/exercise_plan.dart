import 'package:flutter/material.dart';
import 'package:healthproject/widgets/background_image.dart';

class ExercisePlanPage extends StatelessWidget {
  final String title;
  final List<String> plans;

  ExercisePlanPage({
    required this.title,
    required this.plans,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(title),
      ),
      body: Stack(
        children: [
          BackGroundImage5(),
          ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: plans.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    border: Border.all(
                        color: Colors
                            .black), // Kenarlık rengini ve kalınlığını ayarlayın
                    borderRadius: BorderRadius.circular(
                        8), // Kenarlık köşelerini yuvarlayın
                  ),
                  child: ListTile(
                    title: Text(plans[index]),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
