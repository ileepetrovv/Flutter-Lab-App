import 'package:flutter/material.dart';
import '../models/app.dart';
import '../screens/app_detail_screen.dart';
import '../widgets/app_card.dart';
import 'package:intl/intl.dart';

class ExamListScreen extends StatelessWidget {
  ExamListScreen({super.key});

  final List<App> exams = [
    App(subjectName: 'Калкулус', dateTime: DateTime(2025, 11, 15, 9, 0), rooms: ['A1']),
    App(subjectName: 'Структурно програмирање', dateTime: DateTime(2025, 11, 10, 12, 0), rooms: ['B2', 'B3']),
    App(subjectName: 'Програмирање на клиентска страна', dateTime: DateTime(2025, 11, 18, 10, 0), rooms: ['C1']),
    App(subjectName: 'Бизнис и менаџмент', dateTime: DateTime(2025, 11, 1, 9, 30), rooms: ['D1']),
    App(subjectName: 'Вовед во науката за податоци', dateTime: DateTime(2025, 11, 22, 11, 0), rooms: ['E2']),
    App(subjectName: 'Оперативни системи', dateTime: DateTime(2025, 11, 12, 13, 0), rooms: ['Lab 1']),
    App(subjectName: 'Бази на податоци', dateTime: DateTime(2025, 11, 28, 9, 0), rooms: ['Lab 2']),
    App(subjectName: 'Архитектура на компјутери', dateTime: DateTime(2025, 12, 1, 10, 0), rooms: ['F1']),
    App(subjectName: 'Компјутерски мрежи', dateTime: DateTime(2025, 11, 13, 12, 30), rooms: ['G2']),
    App(subjectName: 'Алгоритми', dateTime: DateTime(2025, 11, 18, 9, 0), rooms: ['H3']),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 223280'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return ExamCard(
            app: exam,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExamDetailScreen(app: exam),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
      padding: const EdgeInsets.all(12),
      color: Colors.teal.shade200,
      child: Text(
      'Вкупно испити: ${exams.length}',
      style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.white,
    ),
    textAlign: TextAlign.center,
    ),
),
    );
  }
}