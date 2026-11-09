import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/main.dart';

void main() {
  testWidgets('Home, about and projects navigate on mobile without overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const Portfolio());
    expect(find.text('Kondla Shivani Reddy'), findsOneWidget);
    await tester.tap(find.text('About Me'));
    await tester.pumpAndSettle();
    expect(find.text('Skills & Expertise'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Projects'));
    await tester.pumpAndSettle();
    expect(find.text('Student Performance Prediction System'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
