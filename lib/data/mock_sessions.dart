import '../models/study_session.dart';

// Returns a date [daysFromToday] days from now, at [hour]:[minute].
DateTime _upcoming(int daysFromToday, int hour, [int minute = 0]) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day + daysFromToday, hour, minute);
}

// Fake sessions to show on the home screen until we connect Firestore.
final List<StudySession> mockSessions = [
  StudySession(
    id: 'session-1',
    title: 'Midterm review: linked lists and stacks',
    subject: 'Data Structures',
    description:
        'We will go through past midterm questions on linked lists, '
        'stacks and queues. Bring your laptop.',
    location: 'Main library, 2nd floor',
    startsAt: _upcoming(2, 18),
    capacity: 6,
    hostName: 'Sara Ahmed',
    members: ['sara', 'omar', 'lina'],
  ),
  StudySession(
    id: 'session-2',
    title: 'Integration practice before the quiz',
    subject: 'Calculus',
    description:
        'Integration by parts and substitution. '
        'We will solve problems from chapter 7 on the whiteboard.',
    location: 'Engineering building, room 214',
    startsAt: _upcoming(3, 16, 30),
    capacity: 8,
    hostName: 'Youssef Ali',
    members: ['youssef', 'mona', 'karim', 'nour', 'hana'],
  ),
  StudySession(
    id: 'session-3',
    title: 'Solve last year\'s final together',
    subject: 'Physics',
    description:
        'Mechanics and energy problems from last year\'s final exam. '
        'Calculators allowed.',
    location: 'Student center, study hall B',
    startsAt: _upcoming(5, 19),
    capacity: 5,
    hostName: 'Mariam Hassan',
    members: ['mariam', 'adam'],
  ),
  StudySession(
    id: 'session-4',
    title: 'Balance sheets, chapter 4',
    subject: 'Accounting',
    description:
        'Practice building balance sheets and income statements '
        'from the chapter 4 exercises.',
    location: 'Business school, room 3.12',
    startsAt: _upcoming(8, 11),
    capacity: 6,
    hostName: 'Ahmed Saleh',
    members: ['ahmed', 'farah', 'ziad', 'salma', 'tarek', 'rana'],
  ),
  StudySession(
    id: 'session-5',
    title: 'Essay feedback circle',
    subject: 'English',
    description:
        'Bring a draft of your argumentative essay. '
        'We will swap essays and give each other feedback.',
    location: 'Library, group room 4',
    startsAt: _upcoming(12, 14),
    capacity: 4,
    hostName: 'Laila Mostafa',
    members: ['laila'],
  ),
];
