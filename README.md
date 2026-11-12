# <font color="#8B5CF6">Student Task Manager</font>


### <font color="#2563EB">Smart Flutter app for managing academic tasks, assignments and deadlines!</font>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-Dart-02569B?style=for-the-badge&logo=flutter" />
  <img src="https://img.shields.io/badge/Project-Academic-8B5CF6?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Platform-Mobile-34A853?style=for-the-badge" />
</p>

<p align="center">
  <b>A smart Flutter application for organising academic tasks, assignments, and deadlines.</b>
</p>

<p align="center">
  <a href="https://github.com/pothireddybhavyasri/student_task_manager">
    <b>GitHub Repository</b>
  </a>
</p>

---

## <font color="#8B5CF6">1. Overview</font>

Student Task Manager is a Flutter mobile application that helps students organise academic tasks, manage assignments and track completion of tasks.

As a student, you will complete many assignments, lab work, exams, projects and personal tasks. This application provides an interface that can be used to organise these tasks.

### <font color="#DB2777">Developer</font>

- **Name:** Pothireddy Bhavya Sri
- **College:** ACE Engineering College, Hyderabad
- **Department:** Computer Science and Engineering
- **Project:** Academic Mobile Application
- **Domain:** Flutter, Dart, Mobile Application Development

---

## <font color="#8B5CF6">2. Aims</font>

The aim of the Student Task Manager application is to help students organise tasks, both academic and personal. The application has a responsive layout to allow students to easily manage their tasks.

---

## <font color="#8B5CF6">3. Features</font>

- <font color="#DB2777"><b>Task Management</b></font> - Create, manage and view tasks.
- <font color="#DB2777"><b>Academic Organisation</b></font> - Keep track of assignments.
- <font color="#DB2777"><b>Task Tracker</b></font> - See what tasks are outstanding and mark them as complete.
- <font color="#DB2777"><b>Navigation</b></font> - Use Navigator and named routes to navigate between screens.
- <font color="#DB2777"><b>Reusable Widgets</b></font> - Create reusable widgets and customise the design.
- <font color="#DB2777"><b>Validation</b></font> - Use forms to add task details and validate them.
- <font color="#DB2777"><b>State Management</b></font> - Update the interface by using setState or Provider where applicable.
- <font color="#DB2777"><b>Responsive</b></font> - Responsive application.

---

## <font color="#8B5CF6">4. Technologies Used</font>

<p align="center">
  <img src="https://skillicons.dev/icons?i=flutter,dart,androidstudio,vscode,git,github" alt="Technology Stack"/>
</p>

| Layer | Tech | Description |
|---|---|---|
| Framework | <font color="#2563EB">Flutter</font> | Mobile Application |
| Language | <font color="#2563EB">Dart</font> | Logic |
| UI | Flutter Widgets | Screens |
| Navigation | Navigator / Named Routes | Navigate Between Screens |
| State Management | setState / Provider | Manage Application State |
| Forms | Form / TextFormField | Add Tasks |
| Styling | ThemeData / Custom Styles | Add custom design to application |
| IDE | VS Code / Android Studio | Create Application |
| Source Control | Git / GitHub | Source Control |

---

## <font color="#8B5CF6">5. Flow Diagram</font>

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

### <font color="#2563EB">Application Flow</font>

1. Open the application and view the homepage.
2. Open the task dashboard and choose an option.
3. Enter information into the task form.
4. Validate the entered information.
5. Add the task and update the task list.
6. Mark the task as complete and update its status.
7. View the updated dashboard.

---

## <font color="#8B5CF6">6. File Structure</font>

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

---

## <font color="#8B5CF6">7. How to Get Started</font>

### <font color="#DB2777">Requirements</font>

- Flutter SDK
- Dart SDK
- Android Studio or Visual Studio Code
- Android Emulator or Android Device
- Git

### <font color="#2563EB">1. Clone Repo</font>

```bash
git clone https://github.com/pothireddybhavyasri/student_task_manager.git
cd student_task_manager
```

### <font color="#2563EB">2. Install Dependencies</font>

```bash
flutter pub get
```

### <font color="#2563EB">3. Check Flutter Installation</font>

```bash
flutter doctor
```

### <font color="#2563EB">4. Run App</font>

```bash
flutter run
```

### <font color="#2563EB">5. Run Tests</font>

```bash
flutter test
```

### <font color="#2563EB">6. Generate APK</font>

```bash
flutter build apk --release
```

APK generated at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

# <font color="#8B5CF6">8. Flutter Lab Experiments (1-10)</font>

Below are some short snippets of code for each of the 10 Flutter Labs.

### <font color="#DB2777">1. Flutter Setup</font>

**Aim:** To understand how to set up a Flutter app and use basic widgets.

```dart
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Welcome to Flutter"),
        ),
      ),
    ),
  );
}
```

**Key Concepts:** `runApp()`, `MaterialApp`, `Scaffold`, `Text`

---

### <font color="#DB2777">2. Widgets & Layouts</font>

**Aim:** To implement a layout using Row, Column and basic widgets.

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

**Key Concepts:** `Row`, `Column`, `Icon`, `Text`

---

### <font color="#DB2777">3. Responsive Design</font>

**Aim:** To create a responsive layout using MediaQuery and LayoutBuilder.

```dart
LayoutBuilder(
  builder: (context, constraints) {
    return constraints.maxWidth > 600
        ? const Text("Desktop Layout")
        : const Text("Mobile Layout");
  },
)
```

**Key Concepts:** `MediaQuery`, `LayoutBuilder`

---

### <font color="#DB2777">4. Navigation & Named Routes</font>

**Aim:** To navigate between multiple screens.

```dart
// Navigate to another screen
Navigator.pushNamed(context, '/details');

// Return to previous screen
Navigator.pop(context);
```

**Key Concepts:** `Navigator.pushNamed()`, `Navigator.pop()`

---

### <font color="#DB2777">5. Stateful & Stateless Widgets</font>

**Aim:** To understand how to manage state using setState and Provider.

```dart
int count = 0;

void increment() {
  setState(() {
    count++;
  });
}

Text("Count: $count");
```

**Key Concepts:** `StatefulWidget`, `StatelessWidget`, `setState()`

---

### <font color="#DB2777">6. Custom Widgets & Themes</font>

**Aim:** To create custom widgets and customise the design.

```dart
ThemeData(
  primarySwatch: Colors.blue,
);

ElevatedButton(
  onPressed: () {},
  child: const Text("Add Task"),
);
```

**Key Concepts:** Custom Widgets, `ThemeData`, `ElevatedButton`

---

### <font color="#DB2777">7. Forms & Validation</font>

**Aim:** To create forms with validation.

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

**Key Concepts:** `Form`, `TextFormField`

---

### <font color="#DB2777">8. Animations</font>

**Aim:** To create animations using Flutter animation widgets.

```dart
AnimatedContainer(
  duration: const Duration(seconds: 1),
  width: isExpanded ? 200 : 100,
  height: 100,
  color: Colors.blue,
);
```

**Key Concepts:** `AnimatedContainer`, `Duration`, `setState()`

---

### <font color="#DB2777">9. REST API & JSON</font>

**Aim:** To retrieve data from a REST API.

```dart
final response = await http.get(
  Uri.parse("https://jsonplaceholder.typicode.com/users"),
);

if (response.statusCode == 200) {
  final data = jsonDecode(response.body);
  print(data);
}
```

**Key Concepts:** HTTP Request, JSON Decode

---

### <font color="#DB2777">10. Unit & Widget Testing</font>

**Aim:** To perform unit and widget testing.

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

**Key Concepts:** `flutter_test`, `testWidgets()`, `expect()`

### <font color="#2563EB">Experiment Summary</font>

| Experiment | Topic | Key Concepts |
|---|---|---|
| 1 | Flutter Setup | MaterialApp, Scaffold |
| 2 | Widgets | Row, Column, Stack |
| 3 | Responsive Design | MediaQuery, LayoutBuilder |
| 4 | Navigation | Navigator, Named Routes |
| 5 | State Management | setState, Provider |
| 6 | Custom Widgets | ThemeData, Custom Styles |
| 7 | Forms | TextFormField |
| 8 | Animations | AnimatedContainer |
| 9 | REST API | HTTP, JSON |
| 10 | Testing | Unit Testing, Widget Testing |

---

## <font color="#8B5CF6">9. Testing</font>

| Test | Check |
|---|---|
| UI | Check screens and widgets |
| Navigation | Navigation between screens |
| Forms | Check inputs and validation |
| Task Creation | Check tasks can be created |
| State Management | Check application state can be managed |
| Task Tracker | Check tasks are marked as complete |
| Responsive | Check responsive design |
| Widgets | Check widgets can be reused |
| Integration | Check the full application works |

### <font color="#2563EB">Commands</font>

```bash
flutter analyze
flutter test
flutter doctor
```

---

## <font color="#8B5CF6">10. Screenshots</font>

### <font color="#DB2777">Mobile View</font>

<p align="center">
  <img src="docs/screenshots/flutter_phone_example.jpeg" alt="Student Task Manager - Mobile View" width="300">
</p>

<p align="center">
  <em>Student Task Manager running on a mobile device</em>
</p>

### <font color="#DB2777">Desktop / Web View</font>

<p align="center">
  <img src="docs/screenshots/flutter_example%281%29.jpg" alt="Student Task Manager - Desktop View" width="850">
</p>

<p align="center">
  <em>Student Task Manager responsive dashboard on desktop</em>
</p>

### <font color="#2563EB">Responsive Design</font>

The application has a responsive layout so students can easily manage their tasks on mobile and desktop.

---

## <font color="#8B5CF6">11. Future Improvements</font>

In the future, the project can be improved by adding a local database to store tasks permanently. A calendar can be added to schedule tasks, along with task priorities and reminders for deadlines. Search and filter options can make it easier to find tasks, while subject-wise categorisation can help students organise their academic work. Progress and productivity tracking, cloud synchronisation, user authentication, dark mode and additional themes can also be added in future versions.

---

## <font color="#8B5CF6">12. What I Have Learned</font>

Through this project, I learned how to work with Flutter application structure and Dart programming. I learned to create interfaces using Flutter widgets, navigate between screens, understand StatefulWidget and StatelessWidget, and manage application state. I also worked with forms and validation, reusable custom widgets, customised designs, animations, REST APIs, unit testing and widget testing. The project also helped me understand debugging and the overall process of developing a Flutter mobile application.

---

## <font color="#8B5CF6">13. Conclusion</font>

The Student Task Manager is a Flutter-based academic productivity tool that can help students manage their tasks.

The project shows how to use Flutter widgets, navigation, state management, form validation, custom widgets, responsive design, animations and testing.

The project gives an insight into developing a mobile application and shows how Flutter can be used to create structured and interactive applications.

Improvements can be made to the application by adding a local database, reminders, calendar scheduling and productivity analytics.

---

## <font color="#8B5CF6">14. References</font>

1. [Flutter Documentation](https://docs.flutter.dev/)
2. [Dart Documentation](https://dart.dev/guides)
3. [Flutter Widgets](https://docs.flutter.dev/ui/widgets)
4. [Flutter Navigation](https://docs.flutter.dev/ui/navigation)
5. [Flutter Cookbook](https://docs.flutter.dev/cookbook)
6. [Material Design Guidelines](https://m3.material.io/)

---

<p align="center">
  <b><font color="#8B5CF6">Developed by Pothireddy Bhavya Sri</font></b>
</p>

<p align="center">
  Computer Science and Engineering | ACE Engineering College, Hyderabad
</p>
