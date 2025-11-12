import 'package:flutter/material.dart';
import '../models/app.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final App app;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.app, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isFuture = app.dateTime.isAfter(now);
    final dateFormatted = DateFormat('dd.MM.yyyy').format(app.dateTime);
    final timeFormatted = DateFormat('HH:mm').format(app.dateTime);

    return Card(
      color: isFuture ? Colors.green.shade100 : const Color.fromARGB(255, 125, 19, 19),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Icon(
          isFuture ? Icons.school : Icons.warning_amber_rounded,
          color: isFuture ? Colors.teal : Colors.redAccent,
          size: 32,),
        title: Text(app.subjectName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 4),
              Text('$dateFormatted во $timeFormatted'),
            ]),
            Row(children: [
              const Icon(Icons.room, size: 16),
              const SizedBox(width: 4),
              Text(app.rooms.join(', ')),
            ]),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}