import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_sample/main.dart';
import 'package:mocktail/mocktail.dart';

class MockStateNotifier<T> extends StateNotifier<T> with Mock {
  MockStateNotifier(T state) : super(state);

  set debugSetState(T value) {
    state = value;
  }
}

class MockCounterNotifier extends MockStateNotifier<int> implements CounterNotifier {
  MockCounterNotifier() : super(0);
}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(child: MyApp()));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
