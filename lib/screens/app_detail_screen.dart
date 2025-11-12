import 'package:flutter/material.dart';
import '../models/app.dart';
import 'package:intl/intl.dart';

class ExamDetailScreen extends StatelessWidget {
  final App app;

  const ExamDetailScreen({super.key, required this.app});

  String timeRemaining() {
    final now = DateTime.now();
    final diff = app.dateTime.difference(now);
    if (diff.isNegative) return 'Испитот веќе помина';
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return '$days дена, $hours часа преостануваат';
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat('dd.MM.yyyy').format(app.dateTime);
    final timeFormatted = DateFormat('HH:mm').format(app.dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(app.subjectName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Датум: $dateFormatted', style: const TextStyle(fontSize: 18)),
            Text('Време: $timeFormatted', style: const TextStyle(fontSize: 18)),
            Text('Простории: ${app.rooms.join(', ')}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text(timeRemaining(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
