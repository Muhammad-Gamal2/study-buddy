// A study session that students can join.
class StudySession {
  const StudySession({
    required this.id,
    required this.title,
    required this.subject,
    required this.description,
    required this.location,
    required this.startsAt,
    required this.capacity,
    required this.hostName,
    required this.members,
  });

  final String id;
  final String title;
  final String subject;
  final String description;
  final String location;
  final DateTime startsAt;
  final int capacity;
  final String hostName;
  final List<String> members;

  // How many seats are taken, for example "3/6 joined".
  String get seatsLabel => '${members.length}/$capacity joined';
}
