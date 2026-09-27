# Experiment 4: Navigation

## Aim
To implement screen navigation and routing within the Student Task Manager.

## Objectives
- Create dedicated screens for Home, Task Details, Add Task, Edit Task, and API Demo.
- Use `Navigator` stack operations (`push`, `pop`, `pushNamed`).
- Pass task data seamlessly between screens.

## Flutter Concepts Used
- `Navigator` and Route Management
- Named Routes in `MaterialApp`
- `Navigator.push()` and `Navigator.pop()`
- Data passing via arguments/constructors

## Implementation
Created multiple screens (`TaskDetailsScreen`, `AddTaskScreen`, `EditTaskScreen`, `ApiDemoScreen`). Set up named routes in `main.dart`. The `HomeScreen` floating button/Elevated button routes to `AddTaskScreen`. Tapping a task routes to `TaskDetailsScreen` passing the `Task` object. The details screen includes an edit button that routes to `EditTaskScreen`, and back navigation using `Navigator.pop()`.

## Testing
Widget tests were updated to verify navigation by tapping elements and checking if the Navigator pushes the correct new screen into the tree.

## Result
Multi-screen navigation is fully functional.
