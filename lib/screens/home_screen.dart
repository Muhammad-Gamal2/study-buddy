import 'package:flutter/material.dart';

import '../data/mock_sessions.dart';
import '../models/study_session.dart';
import '../theme.dart';

// The Explore screen: a list of upcoming study sessions.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Soonest sessions first.
    final sessions = [...mockSessions]
      ..sort((a, b) => a.startsAt.compareTo(b.startsAt));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 76,
        titleSpacing: 20,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Study Buddy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 2),
            Text(
              'Find people to study with',
              style: TextStyle(fontSize: 14, color: AppColors.secondaryText),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _SectionHeader(count: sessions.length),
          for (final session in sessions)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: SessionCard(session: session),
            ),
        ],
      ),
    );
  }
}

// The "Upcoming sessions" heading with the number of sessions.
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          const Text(
            'Upcoming sessions',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            '$count sessions',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

// A card that shows one study session.
class SessionCard extends StatelessWidget {
  const SessionCard({super.key, required this.session});

  final StudySession session;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubjectChip(subject: session.subject),
                Text(
                  session.seatsLabel,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              session.title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                height: 22 / 17,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 10),
            _InfoRow(
              icon: Icons.calendar_today_outlined,
              text: formatSessionDate(session.startsAt),
            ),
            const SizedBox(height: 6),
            _InfoRow(icon: Icons.place_outlined, text: session.location),
          ],
        ),
      ),
    );
  }
}

// A small colored label with the session's subject.
class SubjectChip extends StatelessWidget {
  const SubjectChip({super.key, required this.subject});

  final String subject;

  @override
  Widget build(BuildContext context) {
    final colors = subjectColorsFor(subject);

    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        subject,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: colors.foreground,
        ),
      ),
    );
  }
}

// One line of details with an icon, like the date or the location.
class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.secondaryText),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.secondaryText,
            ),
          ),
        ),
      ],
    );
  }
}

const _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
const _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

// Formats a date like "Tue, Nov 10 · 6:00 PM" without the intl package.
String formatSessionDate(DateTime date) {
  final weekday = _weekdays[date.weekday - 1];
  final month = _months[date.month - 1];
  final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
  final minute = date.minute.toString().padLeft(2, '0');
  final period = date.hour < 12 ? 'AM' : 'PM';
  return '$weekday, $month ${date.day} · $hour:$minute $period';
}
