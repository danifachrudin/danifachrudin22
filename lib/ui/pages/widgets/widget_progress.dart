import 'package:flutter/material.dart';



class PersenIndicator extends StatefulWidget {
  const PersenIndicator({super.key});

  @override
  _PersenIndicatorState createState() => _PersenIndicatorState();
}

class _PersenIndicatorState extends State<PersenIndicator> {
  String progress = '0%';

  void updateProgress() {
    // Update the progress here, for example incrementing by 10%
    setState(() {
      int currentProgress = int.parse(progress.split('%')[0]);
      currentProgress += 10;
      if (currentProgress > 100) {
        currentProgress = 0;
      }
      progress = '$currentProgress%';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              progress,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateProgress();
              },
              child: const Text('Update Progress'),
            ),
          ],
        ),
      ),
    );
  }
}