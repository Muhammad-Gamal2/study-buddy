import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:study_buddy/main.dart';
import 'package:study_buddy/screens/home_screen.dart';

void main() {
  testWidgets('Home screen shows the study sessions', (tester) async {
    await tester.pumpWidget(const StudyBuddyApp());

    expect(find.text('Study Buddy'), findsOneWidget);
    expect(find.text('3/6 joined'), findsOneWidget);

    // Scroll to the bottom so every card has been built.
    await tester.dragUntilVisible(
      find.text('Essay feedback circle'),
      find.byType(Scrollable),
      const Offset(0, -200),
    );
    expect(find.text('English'), findsOneWidget);
  });

  test('formatSessionDate uses a 12-hour clock', () {
    expect(
      formatSessionDate(DateTime(2026, 11, 10, 18, 0)),
      'Tue, Nov 10 · 6:00 PM',
    );
    expect(
      formatSessionDate(DateTime(2026, 11, 14, 0, 5)),
      'Sat, Nov 14 · 12:05 AM',
    );
  });
}
