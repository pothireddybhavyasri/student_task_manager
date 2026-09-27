# Experiment 5: State Management

## Aim
To manage application state effectively using `setState` for local UI state and `Provider` with `ChangeNotifier` for global application state.

## Objectives
- Create a `TaskProvider` extending `ChangeNotifier`.
- Wrap the application in a `ChangeNotifierProvider`.
- Implement adding, editing, deleting, and completing tasks.
- Implement a task search functionality.
- Use `setState` for localized UI interactions (e.g., search text input).

## Flutter Concepts Used
- `ChangeNotifier`
- `Provider` package (`ChangeNotifierProvider`, `Consumer`, `context.read`)
- `StatefulWidget` and `setState()`

## Implementation
A `TaskProvider` was introduced to maintain the list of tasks and a search query. The `HomeScreen` was updated to include a `StatefulWidget` search bar, which uses `setState` to track the text controller, and pushes the query to the `TaskProvider`. The list view uses `Consumer<TaskProvider>` to react to state changes (task addition, toggling completion, deletion). The `pubspec.yaml` was updated to include the `provider` package.

## Testing
Verified that adding a task updates the task count, and toggling a task updates its UI state.

## Result
Global state management is successfully implemented without complex architectures or external databases.
