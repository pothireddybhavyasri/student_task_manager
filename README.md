# 📚 Student Task Manager

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![State](https://img.shields.io/badge/State-Provider-blue)
![Design](https://img.shields.io/badge/UI-Material%203-purple)
![Tests](https://img.shields.io/badge/Tests-Unit%20%2B%20Widget-green)

A Flutter app for managing student tasks: add tasks with a priority and due date, search them, mark them done, and delete them. The layout switches between a list (phones) and a 2‑column grid (wider screens). It was built through **10 experiments**, each with its own commits and a write‑up in [`docs/`](docs/).

## 📑 Contents
[Features](#-features) · [Visual Overview](#-visual-overview) · [How to Get the Output](#-how-to-get-the-output) · [Example Output Preview](#-example-output-preview) · [Tech Stack](#-tech-stack) · [Getting Started](#-getting-started) · [Screenshots](#-screenshots) · [Experiments](#-experiments) · [Testing](#-testing) · [Timeline](#-development-timeline) · [Limitations](#-known-limitations) · [Author](#-author)

---

## ✨ Features

| Feature | Status |
|---|---|
| Add task (title, description, priority, due date) with validation | ✅ Implemented |
| Delete task | ✅ Implemented |
| Mark completed / pending (card fades, title struck through) | ✅ Implemented |
| Search by title (live, case‑insensitive) | ✅ Implemented |
| Task counter and empty state | ✅ Implemented |
| Responsive list ↔ grid layout (breakpoint 600 px) | ✅ Implemented |
| Named‑route navigation | ✅ Implemented |
| Light / dark Material 3 theme | ✅ Implemented |
| REST API demo screen (`http`) | ✅ Implemented |
| Edit task | 🚧 Placeholder screen only |
| Task details | 🚧 Shows title only |
| Local storage (Shared Preferences) | ❌ Not implemented (tasks are kept in memory) |

---

## 🎨 Visual Overview

### Home screen layout
Drawn from `lib/screens/home_screen.dart` (a layout diagram, not a screenshot).

```text
┌──────────────────────────────────┐
│     Student Task Manager         │  ← AppBar
├──────────────────────────────────┤
│ 🔍 Search Tasks             ✕    │  ← SearchBox
├──────────────────────────────────┤
│ Total Tasks:                  3  │  ← Consumer<TaskProvider>
├──────────────────────────────────┤
│ ┌──────────────────────────────┐ │
│ │ ○ Task title        Pending  │ │  ← TaskCard
│ │ Description                  │ │     (list on phones,
│ │ 📅 Due date  Priority: High 🗑│ │      2-column grid > 600 px)
│ └──────────────────────────────┘ │
├──────────────────────────────────┤
│         [ + Add Task ]           │
│         [   API Demo  ]          │
└──────────────────────────────────┘
```

### App navigation flow

```mermaid
flowchart TD
    H["Home Screen"] -->|"Add Task"| A["Add Task Form"]
    A -->|"valid, Save Task"| P["TaskProvider.addTask"]
    A -->|"invalid"| E["Validation messages"]
    E --> A
    P --> H
    H -->|"tap a card"| D["Task Details"]
    H -->|"API Demo"| API["API Demo Screen"]
    H -.->|"route exists, placeholder only"| ED["Edit Task"]
```

### State management (Provider)

```mermaid
sequenceDiagram
    participant U as User
    participant S as SearchBox / TaskCard
    participant P as TaskProvider
    participant C as Consumer widgets
    U->>S: type in search / tap circle / tap delete
    S->>P: setSearchQuery / toggleTaskCompletion / deleteTask
    P->>P: update list
    P-->>C: notifyListeners()
    C->>C: rebuild counter and task list
```

### Responsive layout decision

```mermaid
flowchart LR
    W["LayoutBuilder: constraints.maxWidth"] --> Q{"width > 600 ?"}
    Q -->|"yes"| G["GridView, 2 columns"]
    Q -->|"no"| L["ListView, 1 column"]
```

### Task status

```mermaid
stateDiagram-v2
    [*] --> Pending
    Pending --> Done: tap circle icon
    Done --> Pending: tap check icon
    Pending --> [*]: delete
    Done --> [*]: delete
```

### Architecture

```mermaid
flowchart LR
    M["models: Task, ApiUser"] --> S["services: TaskProvider"]
    S --> SC["screens: Home, Add, Details, API Demo"]
    SC --> W["widgets: TaskCard, chips, CustomButton"]
    T["utils: AppThemes"] --> SC
```

---

## 📷 How to Get the Output

1. **Install Flutter** and check your setup: `flutter doctor`
2. **Get the code and dependencies:**
```bash
   git clone https://github.com/pothireddybhavyasri/student_task_manager.git
   cd student_task_manager
   flutter pub get
```
3. **Run the app** (Chrome is the easiest way to see the responsive layout):
```bash
   flutter run -d chrome
```
   You can also run it on an Android emulator or a connected phone with `flutter run`.
4. **Try the features and see the output:**

   | Step | Action | Output you should see |
   |---|---|---|
   | 1 | Open the app | "No tasks yet. Add one!" and `Total Tasks: 0` |
   | 2 | Tap **Add Task**, leave fields empty, tap **Save Task** | Red validation messages under the fields |
   | 3 | Fill in the form and save | The task card appears; counter becomes 1 |
   | 4 | Tap the circle icon on a card | Card fades, title struck through, chip changes to **Done** |
   | 5 | Type in **Search Tasks** | Only tasks with matching titles are shown |
   | 6 | Tap the trash icon | The task is removed |
   | 7 | Resize the Chrome window past 600 px | Layout switches from 1 column to a 2-column grid |

5. **Run the tests:** `flutter test`

---

## 🖼 Example Output Preview

> These images are **illustrations of the expected output**, drawn from the app's code. They are not real screenshots. Real screenshots are in the Screenshots section.

| Phone (list view) | Add Task validation |
|:---:|:---:|
| <img src="docs/preview/example_home_list_phone.png" width="300"> | <img src="docs/preview/example_add_task_validation.png" width="300"> |

**Wide window (2-column grid, width above 600 px):**

<img src="docs/preview/example_home_grid_wide.png" width="650">

---

## 🛠 Tech Stack

| Package | Purpose |
|---|---|
| Flutter / Dart `^3.13.0` | UI framework |
| `provider` | State management |
| `http` | REST API call |
| `flutter_test` | Unit and widget tests |

**Structure:** `lib/models` (Task, ApiUser) · `lib/services` (TaskProvider) · `lib/screens` (home, add, edit, details, API demo) · `lib/widgets` (TaskCard, chips, CustomButton) · `lib/utils` (themes) · `test/` · `docs/`

---

## 🚀 Getting Started

```bash
git clone https://github.com/pothireddybhavyasri/student_task_manager.git
cd student_task_manager
flutter pub get
flutter run -d chrome   # or any connected device
flutter test
```

---

## 🖼 Screenshots

Real screenshots of the running app go in `docs/screenshots/`.

| Screen | File |
|---|---|
| Home, phone width (list) | `docs/screenshots/home_list_phone.png` |
| Home, wide window (2‑column grid) | `docs/screenshots/home_grid_wide.png` |
| Add Task with validation errors | `docs/screenshots/add_task_validation.png` |
| Search results | `docs/screenshots/search.png` |
| Completed task | `docs/screenshots/completed.png` |
| API Demo | `docs/screenshots/api_demo.png` |

<!-- After uploading the images, replace the table above with this:

| Phone (list) | Wide window (2-column grid) |
|:---:|:---:|
| <img src="docs/screenshots/home_list_phone.png" width="300"> | <img src="docs/screenshots/home_grid_wide.png" width="450"> |
| **Add Task validation** | **Completed task** |
| <img src="docs/screenshots/add_task_validation.png" width="300"> | <img src="docs/screenshots/completed.png" width="300"> |
-->

## 🧪 Experiments

Snippets are trimmed excerpts from the source (`// ...` marks omitted lines).

### Exp 1 – Flutter & Dart foundation
App entry point with Provider set up at the root. Commits: `b4aa9d0`, `17c3e5d`, `deffa58`

```dart
// lib/main.dart
runApp(
  ChangeNotifierProvider(
    create: (context) => TaskProvider(),
    child: const StudentTaskManagerApp(),
  ),
);
```

### Exp 2 – Widgets and layouts
`TaskCard` is built from `Column`, `Row`, `Expanded` and `Flexible`. The due date uses `Flexible` with `TextOverflow.ellipsis` so long text doesn't overflow. Commits: `cd24a70`, `7910a1a`, `1aaf286`

### Exp 3 – Responsive UI
`MediaQuery` gives screen size and orientation. `LayoutBuilder` picks a list or grid by available width. Commits: `bcbb5e9`, `0aa3653`, `9cb6d76`

```dart
// lib/screens/home_screen.dart
final isLandscape = mediaQuery.orientation == Orientation.landscape;
final paddingValue = mediaQuery.size.width * 0.02;
// ...
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return GridView.builder(/* crossAxisCount: 2 */ ...);
    } else {
      return ListView.builder(...);
    }
  },
)
```

**See it:** run `flutter run -d chrome` and resize the window across 600 px: one column below, two above.

### Exp 4 – Navigation
Named routes are declared in `MaterialApp`; tapping a card opens the details screen. Commits: `e38c7a5`, `0ddf453`, `f7d6dcd`

```dart
// lib/main.dart
routes: {
  '/': (context) => const HomeScreen(),
  '/add-task': (context) => const AddTaskScreen(),
  '/edit-task': (context) => const EditTaskScreen(),
  '/api-demo': (context) => const ApiDemoScreen(),
},
```

### Exp 5 – State management (Provider)
`TaskProvider` holds the task list and search query, and calls `notifyListeners()` after every change. Commits: `1e8f413`, `49dcb3d`, `dce724b`

```dart
// lib/services/task_provider.dart
List<Task> get tasks {
  if (_searchQuery.isEmpty) return _tasks;
  return _tasks
      .where((t) => t.title.toLowerCase().contains(_searchQuery.toLowerCase()))
      .toList();
}

void toggleTaskCompletion(String id) {
  final index = _tasks.indexWhere((t) => t.id == id);
  if (index != -1) {
    _tasks[index] = _tasks[index].copyWith(isCompleted: !_tasks[index].isCompleted);
    notifyListeners();
  }
}
```

### Exp 6 – Custom widgets and themes
Reusable `CustomButton`, `PriorityChip` and `StatusChip`; light and dark themes built from one seed colour with Material 3. Commits: `dbcc41d`, `9988786`, `40ae657`

### Exp 7 – Forms and validation
Fields are validated before a task is saved. Messages: `Please enter a task title`, `Please enter a description`, `Description must be at least 5 characters long`, `Please enter a due date`. Commits: `b3a7f1a`, `8f73f28`, `5b636bd`

```dart
// lib/screens/add_task_screen.dart
validator: (value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a task title';
  }
  return null;
},
// ...
if (_formKey.currentState!.validate()) {
  _formKey.currentState!.save();
  // ... create Task
  context.read<TaskProvider>().addTask(newTask);
  Navigator.pop(context);
}
```

### Exp 8 – Animations
Completing a task animates the card's opacity, colour and shadow over 500 ms. Commits: `f625849`, `151ad4f`, `a4a6320`

```dart
// lib/widgets/task_card.dart
AnimatedOpacity(
  duration: const Duration(milliseconds: 500),
  opacity: task.isCompleted ? 0.6 : 1.0,
  child: AnimatedContainer(duration: const Duration(milliseconds: 500), ...),
)
```

### Exp 9 – REST API
Fetches users from `https://jsonplaceholder.typicode.com/users` and shows loading, error and empty states with `FutureBuilder`. Commits: `9767c55`, `af7f50f`, `c13f7f6`

```dart
// lib/screens/api_demo_screen.dart
final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
if (response.statusCode == 200) {
  List<dynamic> data = json.decode(response.body);
  return data.map((json) => ApiUser.fromJson(json)).toList();
} else {
  throw Exception('Failed to load users');
}
```

### Exp 10 – Testing
Unit tests for the model and provider, plus a widget test that adds a task, toggles it and opens the API demo. Commits: `7cc6d2f`, `be818d4`, `a207f1a`

```dart
// test/services_test.dart
provider.setSearchQuery('App');
expect(provider.tasks.length, 1);
expect(provider.tasks.first.title, 'Apple');
```

---

## ✅ Testing

```bash
flutter analyze
flutter test
```

| File | Covers |
|---|---|
| `test/models_test.dart` | `Task.copyWith` |
| `test/services_test.dart` | add/delete, toggle completion, search |
| `test/widget_test.dart` | add task, toggle, API demo error state (400×800) |

**Latest result:**
<!-- Run `flutter test` and paste the real output here. -->

---

## 🕒 Development Timeline

From `git log` (timezone +05:30).

| Date | Commits | Change |
|---|---|---|
| 2026‑08‑18 | `7e8e9a0`, `4f86e85` | Initial home screen, first full project commit |
| 2026‑09‑27 | `b4aa9d0`–`deffa58` | Exp 1 – foundation |
| 2026‑09‑27 | `cd24a70`–`1aaf286` | Exp 2 – widgets and layouts |
| 2026‑09‑27 | `bcbb5e9`–`9cb6d76` | Exp 3 – responsive UI |
| 2026‑09‑27 | `e38c7a5`–`f7d6dcd` | Exp 4 – navigation |
| 2026‑09‑27 | `1e8f413`–`dce724b` | Exp 5 – Provider |
| 2026‑09‑27 | `dbcc41d`–`40ae657` | Exp 6 – custom widgets, themes |
| 2026‑09‑27 | `b3a7f1a`–`5b636bd` | Exp 7 – forms, validation |
| 2026‑09‑27 | `f625849`–`a4a6320` | Exp 8 – animations |
| 2026‑09‑27 | `9767c55`–`c13f7f6` | Exp 9 – REST API |
| 2026‑09‑27 | `7cc6d2f`–`a207f1a` | Exp 10 – tests |

---

## ⚠️ Known Limitations

- Tasks are stored in memory only and are lost on restart (`shared_preferences` is not used).
- Edit Task is a placeholder; `updateTask` exists in the provider but has no UI yet.
- Task details shows only the title.
- Due date is a free‑text field, not a date picker.
- Search matches titles only.

**Planned:** persistence with `shared_preferences`, edit form, date picker, filters by priority and status.

---

## 👩‍💻 Author

**Bhavya Sri** — [GitHub](https://github.com/pothireddybhavyasri) · [LinkedIn](https://www.linkedin.com/in/pothireddy-bhavya-sri-031193328)
