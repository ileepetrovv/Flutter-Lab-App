class App {
  final String subjectName;
  final DateTime dateTime;
  final List<String> rooms;
  final bool isPassed;

  App({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
    this.isPassed = false,
  });
}