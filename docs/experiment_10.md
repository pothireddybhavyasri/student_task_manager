# Experiment 10: Testing and Debugging

## Aim
To ensure application reliability through automated testing.

## Objectives
- Implement Unit tests for data models.
- Implement Unit tests for state management providers.
- Implement comprehensive Widget tests for UI flows.
- Use `flutter test` to execute the test suite.

## Flutter Concepts Used
- `flutter_test` package
- `test()` and `group()` functions
- `testWidgets()`, `pumpWidget()`, and `pumpAndSettle()`
- `expect()` assertions

## Implementation
Created `test/models_test.dart` to verify the `Task` model's immutability and `copyWith` logic. Created `test/services_test.dart` to test the logic of `TaskProvider` independent of the UI (adding, deleting, toggling, and searching). Refactored `test/widget_test.dart` into a complete end-to-end user flow test, verifying that tasks can be added, toggled, and that the API Demo Screen correctly handles disabled network environments during tests.

## Testing
All tests executed and passing successfully via `flutter test`.

## Result
The application logic and UI are covered by automated tests, marking the successful completion of all 10 experiments!
