
#  Student Task Manager
### Organize Your Tasks. Stay Focused. Meet Every Deadline.

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-Dart-02569B?style=for-the-badge&logo=flutter" />
  <img src="https://img.shields.io/badge/Project-Academic-8B5CF6?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Platform-Mobile-34A853?style=for-the-badge" />
</p>

<p align="center">
  <b>A smart Flutter application for organizing academic tasks, assignments, and deadlines.</b>
</p>

<p align="center">
  <a href="https://github.com/pothireddybhavyasri/student_task_manager">GitHub Repository</a>
</p>
---

##  1. Project Overview

Student Task Manager is a Flutter-based mobile application designed to help students organize academic responsibilities, manage assignments, track task completion, and improve time management.

Students regularly handle assignments, laboratory records, examinations, projects, and personal activities. This application provides a centralized interface to organize tasks and maintain a structured academic workflow.

**Developed by:** Pothireddy Bhavya Sri  
**College:** ACE Engineering College, Hyderabad  
**Department:** Computer Science and Engineering  
**Project Type:** Academic Mobile Application  
**Domain:** Flutter | Dart | Mobile Application Development

---

2. Objectives

Organise academic tasks and personal tasks
Create and manage tasks
Keep track of pending tasks
Make it easy to create and monitor tasks
Navigate between pages
Use reusable widgets and customised styling
Implement state management and form validation
Create a responsive mobile application

##  3. Key Features

- **Task Management:** Create, organize, and view academic tasks.
- **Academic Organization:** Maintain an overview of assignments and responsibilities.
- **Task Tracking:** Identify pending tasks and mark activities completed.
- **Navigation:** Move between screens using Navigator and named routes.
- **Custom Widgets:** Reuse UI components and apply consistent styling.
- **Form Validation:** Accept task information and validate required fields.
- **State Management:** Update the interface using setState or Provider where implemented.
- **Responsive Interface:** Adapt layouts to different display sizes.

## 4. Technology Stack

<p align="center">
  <img src="https://skillicons.dev/icons?i=flutter,dart,androidstudio,vscode,git,github" alt="Technology Stack"/>
</p>

| Layer | Technology | Purpose |
|---|---|---|
| Framework | Flutter | Mobile application development |
| Language | Dart | Application logic |
| UI | Flutter Widgets | Application screens |
| Navigation | Navigator / Named Routes | Screen navigation |
| State Management | setState / Provider | Updating application state |
| Forms | Form / TextFormField | Input and validation |
| Styling | ThemeData / Custom Styles | Application appearance |
| IDE | VS Code / Android Studio | Development and debugging |
| Version Control | Git and GitHub | Source code management |

---

##  5. Application Workflow

```mermaid
flowchart TD
    A([Start Application]) --> B[Home Screen]
    B --> C[Task Dashboard]
    C --> D{Select Action}
    D -->|Add Task| E[Open Task Form]
    E --> F[Enter Task Details]
    F --> G{Validate Input}
    G -->|Invalid| H[Display Error]
    H --> F
    G -->|Valid| I[Create Task]
    I --> J[Update Task List]
    D -->|View Tasks| J
    D -->|Complete Task| K[Update Task Status]
    K --> J
    J --> L[Refresh Dashboard]
    L --> M([End])
```


##  6. System Architecture

```mermaid
flowchart TB
    U[Student / User]

    subgraph UI["Presentation Layer"]
        A[Flutter Application]
        B[Home Screen]
        C[Task Dashboard]
        D[Task Form]
        E[Other Screens]
    end

    subgraph LOGIC["Application Logic"]
        F[Navigation Manager]
        G[Task Management]
        H[Form Validation]
        I[State Management]
    end

    subgraph DATA["Data Handling"]
        J[Task Information]
        K[Task Status]
    end

    U --> A
    A --> B
    A --> C
    A --> D
    A --> E
    B --> F
    C --> G
    D --> H
    G --> I
    H --> I
    I --> J
    I --> K
    J --> C
    K --> C
```



##  9. Repository Structure

```text
student_task_manager/
├── android/
├── ios/
├── web/
├── lib/
│   ├── main.dart
│   ├── screens/
│   ├── widgets/
│   ├── models/
│   ├── services/
│   └── theme/
├── assets/
├── test/
├── pubspec.yaml
├── pubspec.lock
├── analysis_options.yaml
└── README.md
```

##  10. Getting Started

### Prerequisites

- Flutter SDK and Dart SDK
- Android Studio or Visual Studio Code
- Android Emulator or physical Android device
- Git

### 1. Clone the Repository

```bash
git clone https://github.com/pothireddybhavyasri/student_task_manager.git
cd student_task_manager
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Check Flutter Setup

```bash
flutter doctor
```

### 4. Run the Application

```bash
flutter run
```

### 5. Run Tests

```bash
flutter test
```

### 6. Build APK

```bash
flutter build apk --release
```

Generated APK location:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

##  11. Flutter Experiments (1–10)

This section contains compact code highlights for the ten Flutter laboratory experiments.

### Experiment 1: Flutter Application Setup

**Aim:** Understand Flutter application setup and basic widgets.

```dart
void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(child: Text("Welcome to Flutter")),
    ),
  ));
}
```

**Concepts:** `runApp()`, `MaterialApp`, `Scaffold`, `Text`.

### Experiment 2: Flutter Widgets and Layouts

**Aim:** Implement layouts using Row, Column, and basic widgets.

```dart
Column(
  children: [
    const Text("Student Task Manager"),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.home),
        Icon(Icons.task),
        Icon(Icons.person),
      ],
    ),
  ],
)
```

**Concepts:** `Row`, `Column`, `Icon`, `Text`.

### Experiment 3: Responsive UI

**Aim:** Create responsive layouts using MediaQuery and LayoutBuilder.

```dart
LayoutBuilder(
  builder: (context, constraints) {
    return constraints.maxWidth > 600
        ? const Text("Desktop Layout")
        : const Text("Mobile Layout");
  },
)
```

**Concepts:** `MediaQuery`, `LayoutBuilder`, responsive design.

### Experiment 4: Navigation and Named Routes

**Aim:** Navigate between multiple application screens.

```dart
// Navigate to another screen
Navigator.pushNamed(context, '/details');

// Return to previous screen
Navigator.pop(context);
```

**Concepts:** `Navigator.pushNamed()`, `Navigator.pop()`.

### Experiment 5: Stateful and Stateless Widgets

**Aim:** Understand state management using setState and Provider.

```dart
int count = 0;

void increment() {
  setState(() {
    count++;
  });
}

Text("Count: $count");
```

**Concepts:** `StatefulWidget`, `StatelessWidget`, `setState()`.

### Experiment 6: Custom Widgets and Themes

**Aim:** Create reusable widgets and apply custom styling.

```dart
ThemeData(
  primarySwatch: Colors.blue,
);

ElevatedButton(
  onPressed: () {},
  child: const Text("Add Task"),
);
```

**Concepts:** Custom widgets, `ThemeData`, `ElevatedButton`.

### Experiment 7: Forms and Validation

**Aim:** Create forms with input fields and validation.

```dart
TextFormField(
  decoration: const InputDecoration(
    labelText: "Task Name",
    border: OutlineInputBorder(),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Enter task name";
    }
    return null;
  },
);
```

**Concepts:** `Form`, `TextFormField`, validation.

### Experiment 8: Flutter Animations

**Aim:** Implement animations using Flutter animation widgets.

```dart
AnimatedContainer(
  duration: const Duration(seconds: 1),
  width: isExpanded ? 200 : 100,
  height: 100,
  color: Colors.blue,
);
```

**Concepts:** `AnimatedContainer`, `Duration`, `setState()`.

### Experiment 9: REST API and JSON

**Aim:** Fetch and process data from a REST API.

```dart
final response = await http.get(
  Uri.parse("https://jsonplaceholder.typicode.com/users"),
);

if (response.statusCode == 200) {
  final data = jsonDecode(response.body);
  print(data);
}
```

**Concepts:** HTTP requests, JSON decoding, API integration.

### Experiment 10: Unit and Widget Testing

**Aim:** Perform unit testing and widget testing.

```dart
test('Addition test', () {
  expect(10 + 20, 30);
});

testWidgets('Text visibility test',
    (WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: Text("Student Task Manager"),
    ),
  );

  expect(
    find.text("Student Task Manager"),
    findsOneWidget,
  );
});
```

**Concepts:** `flutter_test`, `testWidgets()`, `expect()`.

### Experiment Summary

---

##  12. Testing and Verification

| Testing Area | What to Verify |
|---|---|
| UI Testing | Screen layouts and widget rendering |
| Navigation Testing | Movement between screens |
| Form Testing | Input fields and validation |
| Task Creation | Adding new tasks |
| State Management | Updating application state |
| Task Tracking | Completion status |
| Responsive Testing | Layout on different screen sizes |
| Widget Testing | Reusable widget behavior |
| Integration Testing | Complete application workflow |

### Testing Commands

```bash
flutter analyze
flutter test
flutter doctor
```

---
## 13. Application Screenshots

### Mobile View

<p align="center">
  <img src="docs/screenshots/flutter_phone_example.jpeg" alt="Student Task Manager - Mobile View" width="300">
</p>

<p align="center">
  <em>Student Task Manager running on a mobile device</em>
</p>

### Desktop / Web View

<p align="center">
  <img src="docs/screenshots/flutter_example%281%29.jpg" alt="Student Task Manager - Desktop View" width="850">
</p>

<p align="center">
  <em>Student Task Manager responsive dashboard on desktop</em>
</p>

### Responsive Design

The application provides a responsive interface that adapts to different screen sizes, allowing students to manage tasks comfortably on both mobile and desktop devices.

##  14. Learning Outcomes

- Understanding Flutter application architecture.
- Working with Dart programming language.
- Developing interfaces using Flutter widgets.
- Implementing navigation between screens.
- Understanding StatefulWidget and StatelessWidget.
- Applying state management techniques.
- Creating forms and validating user input.
- Designing reusable custom widgets.
- Applying themes and custom styling.
- Understanding animations and API integration.
- Performing unit and widget testing.
- Debugging Flutter applications.

---

##  15. Future Enhancements

Use a local database to store tasks
Add a calendar to schedule tasks
Add task priorities
Add deadline reminders
Add search and filter options
Categorise tasks by subject
Add progress and productivity tracking
Add cloud synchronisation
Add user authentication
Add dark mode and extra themes

---

##  16. Conclusion

Student Task Manager is a Flutter-based academic productivity application designed to simplify task organization and improve student time management.

The project demonstrates practical implementation of Flutter widgets, navigation, state management, form validation, custom styling, responsive layouts, animations, and testing concepts.

It provides hands-on experience in mobile application development and demonstrates how Flutter can be used to build structured and interactive applications.

Future improvements can introduce persistent database storage, reminders, calendar scheduling, and productivity analytics to make the application more comprehensive.

---

##  17. References

1. [Flutter Official Documentation](https://docs.flutter.dev/)
2. [Dart Official Documentation](https://dart.dev/guides)
3. [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)
4. [Flutter Navigation Documentation](https://docs.flutter.dev/ui/navigation)
5. [Flutter Cookbook](https://docs.flutter.dev/cookbook)
6. [Material Design Guidelines](https://m3.material.io/)

---

##  Developer

**Pothireddy Bhavya Sri**  
Computer Science and Engineering  
ACE Engineering College, Hyderabad

<p align="center">
  <b>Built with Flutter 💙</b><br/>
  Organize Your Tasks. Stay Focused. Meet Every Deadline.
</p>

