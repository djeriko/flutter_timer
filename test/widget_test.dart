import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_timer/background.dart';

import 'package:flutter_timer/main.dart';
import 'package:flutter_timer/timer.dart';

void main() {
  group('MyApp', () {
    testWidgets('is a StatelessWidget', (tester) async {
      expect(MyApp(), isA<StatelessWidget>());
    });

    testWidgets('contains Timer widget', (tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byType(Timer), findsOneWidget);
    });

    testWidgets("renders background", (tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byType(Background), findsOneWidget);
    });
  });
}
