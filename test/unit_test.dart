import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample/main.dart';
import 'package:flutter_test/flutter_test.dart';
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

  test('Test business logic.', () {
    final container = ProviderContainer();

    final displayString = container.read(counterStateProvider.notifier).increment();
    final resultState = container.read(counterStateProvider);
    expect(
      displayString,
      '1',
    );
    expect(
      resultState,
      1,
    );
  });
}