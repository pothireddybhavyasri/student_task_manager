Student Task Manager

Organize your tasks. Stay focused. Meet every deadline.

Student Task Manager is a Flutter-based application developed to help students manage their academic activities in an organized way. It provides a simple interface where students can add tasks, set priorities, track due dates, search for tasks, and monitor their completion status.

The project demonstrates the practical use of Flutter and Dart, including state management, responsive UI design, form validation, navigation, animations, and REST API integration.

---

Table of Contents

1. Project Overview
2. Features and Implementation
3. Technology Stack
4. Getting Started
5. Project Structure
6. Experiments (1–10)
7. Application Preview
8. Testing and Verification
9. Development Timeline
10. Known Limitations
11. Future Enhancements
12. Author

---

1. Project Overview

Student Task Manager is a cross-platform application developed using Flutter. It provides students with a convenient way to organize assignments, academic activities, and other important tasks.

The application includes a dashboard that displays task information and allows users to add, search, complete, and delete tasks. It also uses Provider for state management and supports different screen sizes through responsive layouts.

The main purpose of this project is to understand how Flutter concepts can be combined to develop a functional and user-friendly application.

2. Features and Implementation

The application includes the following features:

Feature| Description| Status
Add Task| Add tasks with title, description, priority, and due date| Implemented
Delete Task| Remove tasks from the task list| Implemented
Task Completion| Mark tasks as completed or pending| Implemented
Search| Search tasks using their titles| Implemented
Task Counter| Display the total number of tasks| Implemented
Responsive Layout| Adjust the layout according to screen width| Implemented
Navigation| Move between screens using named routes| Implemented
Themes| Support light and dark modes using Material 3| Implemented
REST API| Retrieve sample user information from an external API| Implemented
Edit Task| Edit screen is available as a placeholder| Partial
Task Details| Currently displays the task title| Limited
Local Storage| Tasks are stored in application memory| Not Implemented

Additional Features

The dashboard displays task information such as total tasks, pending tasks, completed tasks, and high-priority tasks.

The application uses Provider to update information whenever a task is added, deleted, or marked as completed.

The interface is designed to work on both mobile and larger screens. It uses a single-column list on smaller screens and a two-column grid on wider screens.

Reusable widgets and consistent styling help maintain the same appearance throughout the application.

3. Application Design

3.1 Home Screen Layout

The home screen contains the application title, search bar, task summary, and task cards. Users can access the task creation screen and API demonstration screen from the dashboard.

The following diagram represents the basic layout of the application.

----------------------------------
       Student Task Manager
----------------------------------
 Search Tasks
----------------------------------
 Total Tasks: 3
----------------------------------
 Task Title             Pending
 Description
 Due Date        Priority: High
----------------------------------
          Add Task
----------------------------------
          API Demo
----------------------------------

3.2 Navigation Flow

The application uses named routes to navigate between different screens.

flowchart TD
    H[Home Screen] --> A[Add Task Screen]
    A --> V[Form Validation]
    V -->|Valid| P[Task Provider]
    V -->|Invalid| E[Display Error Messages]
    E --> A
    P --> H
    H --> D[Task Details]
    H --> API[API Demo Screen]
    H --> ED[Edit Task Placeholder]

3.3 State Management

Provider is used to manage the task information throughout the application.

Whenever a user performs an action, the corresponding method in TaskProvider updates the task list. The notifyListeners() method then informs the listening widgets to rebuild with the updated information.

flowchart TD
    U[User Action] --> P[TaskProvider Method]
    P --> T[Update Task List]
    T --> N[notifyListeners]
    N --> C[Consumer Widgets]
    C --> R[Updated Interface]

3.4 Responsive Design

The application uses LayoutBuilder to check the available screen width.

- When the screen width is below 600 pixels, tasks are displayed using a ListView.
- When the screen width is above 600 pixels, tasks are displayed using a two-column GridView.

This allows the application to adjust its layout according to the device being used.

4. Technology Stack

The following technologies and tools were used during development.

Technology| Purpose
Flutter| Application development
Dart| Programming language
Provider| State management
HTTP| REST API communication
Google Fonts| Typography
Material 3| User interface design
Visual Studio Code| Code editing and debugging
Git and GitHub| Version control and project hosting

5. Getting Started

To run the project locally, Flutter SDK and Dart should be installed on the system.

Step 1: Clone the Repository

git clone https://github.com/pothireddybhavyasri/student_task_manager.git

Step 2: Open the Project Folder

cd student_task_manager

Step 3: Install Dependencies

flutter pub get

Step 4: Run the Application

flutter run -d chrome

Step 5: Check the Project

To identify possible issues:

flutter analyze

To execute the available tests:

flutter test

6. Project Structure

The project is organized into different folders to separate application screens, data models, business logic, and reusable components.

student_task_manager/
|
|-- lib/
|   |
|   |-- main.dart
|   |
|   |-- models/
|   |   |-- task.dart
|   |   |-- api_user.dart
|   |
|   |-- screens/
|   |   |-- home_screen.dart
|   |   |-- add_task_screen.dart
|   |   |-- edit_task_screen.dart
|   |   |-- task_details_screen.dart
|   |   |-- api_demo_screen.dart
|   |
|   |-- services/
|   |   |-- task_provider.dart
|   |
|   |-- utils/
|   |   |-- app_themes.dart
|   |
|   |-- widgets/
|       |-- task_card.dart
|       |-- custom_button.dart
|       |-- priority_chip.dart
|
|-- test/
|   |-- models_test.dart
|   |-- services_test.dart
|   |-- widget_test.dart
|
|-- docs/
|   |-- screenshots/
|
|-- pubspec.yaml

7. Experiments (1–10)

The project was developed through ten experimental stages. Each stage focused on implementing and understanding a particular Flutter concept.

Experiment 1: Flutter and Dart Fundamentals

The initial stage involved setting up the Flutter project and understanding its basic structure. The main application entry point was created, and Provider was configured at the root level to manage application state.

runApp(
  ChangeNotifierProvider(
    create: (context) => TaskProvider(),
    child: const StudentTaskManagerApp(),
  ),
);

Experiment 2: Widgets and Layouts

Different Flutter widgets such as Column, Row, Expanded, and Flexible were used to design the application interface.

The TaskCard widget was created to display task information in an organized format. Flexible widgets were also used to avoid text overflow when displaying longer descriptions and due dates.

Experiment 3: Responsive User Interface

Responsive design was implemented using MediaQuery and LayoutBuilder.

The application checks the available screen width and selects the appropriate layout. A ListView is displayed on smaller screens, while a two-column GridView is used on wider screens.

LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return GridView.builder(
        // Two-column layout
      );
    } else {
      return ListView.builder(
        // Single-column layout
      );
    }
  },
)

Experiment 4: Navigation

Named routes were implemented to move between the home screen, add-task screen, edit-task screen, and API demonstration screen.

routes: {
  '/': (context) => const HomeScreen(),
  '/add-task': (context) => const AddTaskScreen(),
  '/edit-task': (context) => const EditTaskScreen(),
  '/api-demo': (context) => const ApiDemoScreen(),
},

Experiment 5: State Management Using Provider

Provider was used to manage the task list and search functionality.

The TaskProvider class contains methods to add tasks, delete tasks, change completion status, and search tasks by title.

The notifyListeners() method updates the widgets whenever the task information changes.

void toggleTaskCompletion(String id) {
  final index = _tasks.indexWhere((t) => t.id == id);

  if (index != -1) {
    _tasks[index] = _tasks[index].copyWith(
      isCompleted: !_tasks[index].isCompleted,
    );

    notifyListeners();
  }
}

Experiment 6: Custom Widgets and Themes

Reusable widgets such as CustomButton, PriorityChip, and StatusChip were created to maintain consistency across the application.

Light and dark themes were configured using Material 3. This allows the application to maintain a consistent appearance while supporting different display preferences.

Experiment 7: Forms and Validation

A task creation form was developed with fields for task title, description, priority, and due date.

Form validation was added to prevent users from submitting incomplete information.

The application displays appropriate messages when required fields are empty or when the description does not meet the minimum length.

validator: (value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a task title';
  }

  return null;
},

After successful validation, the task is added through TaskProvider.

Experiment 8: Animations

Flutter animation widgets were used to provide visual feedback when a task is marked as completed.

AnimatedOpacity and AnimatedContainer are used to change the appearance of completed task cards.

The transition duration is set to 500 milliseconds.

AnimatedOpacity(
  duration: const Duration(milliseconds: 500),
  opacity: task.isCompleted ? 0.6 : 1.0,
  child: AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    child: // Task content
  ),
)

Experiment 9: REST API Integration

The HTTP package was used to retrieve sample user information from the JSONPlaceholder REST API.

The application sends a GET request to the API and processes the returned JSON data.

The API screen also handles loading and error states.

final response = await http.get(
  Uri.parse(
    'https://jsonplaceholder.typicode.com/users',
  ),
);

if (response.statusCode == 200) {
  List<dynamic> data = json.decode(response.body);

  return data.map((json) => ApiUser.fromJson(json)).toList();
} else {
  throw Exception('Failed to load users');
}

Experiment 10: Testing

Testing was performed to check the main functionality of the application.

Unit tests were written for the Task model and TaskProvider. Widget tests were also created to verify selected user interactions, including adding tasks, changing completion status, and opening the API demonstration screen.

The tests helped identify issues and verify the behavior of the implemented features.

8. Application Preview

The application was tested using different screen sizes to check its responsive behavior.

The following screenshots are available in the project repository:

Screenshot| Description
"docs/screenshots/flutter_phone_example.jpeg"| Mobile application with a single-column task list
"docs/screenshots/flutter_example(1).jpg"| Desktop dashboard with task summary and grid layout

These screenshots demonstrate how the interface changes according to the available screen space.

9. Testing and Verification

The following commands were used during testing.

flutter analyze
flutter test

The project includes the following test files:

Test File| Purpose
"test/models_test.dart"| Tests Task model and copyWith functionality
"test/services_test.dart"| Tests adding, deleting, completing, and searching tasks
"test/widget_test.dart"| Tests selected application interactions

Testing Results

The recorded static analysis result was:

Analyzing student_task_manager...
No issues found!

The test execution confirmed that the model and provider tests were running successfully. However, one widget test failed after the user interface was redesigned.

The failure was related to the test expecting one task-counter widget while the updated dashboard contained four summary cards.

This issue indicates that the widget test needs to be updated to match the redesigned interface.

10. Development Timeline

The following timeline is based on the project repository's Git commit history.

Date| Development Activity
18-08-2026| Initial project setup and home screen development
27-09-2026| Experiment 1: Flutter and Dart fundamentals
27-09-2026| Experiment 2: Widgets and layouts
27-09-2026| Experiment 3: Responsive user interface
27-09-2026| Experiment 4: Navigation
27-09-2026| Experiment 5: Provider state management
27-09-2026| Experiment 6: Custom widgets and themes
27-09-2026| Experiment 7: Forms and validation
27-09-2026| Experiment 8: Animations
27-09-2026| Experiment 9: REST API integration
27-09-2026| Experiment 10: Testing
09-10-2026| User interface redesign and dashboard improvements

11. Known Limitations

Although the application supports the main task management operations, some features can be improved.

- Tasks are stored in application memory and are lost when the application restarts.
- The due date is entered as text instead of using a date picker.
- The search feature currently matches task titles only.
- The edit-task screen is available as a placeholder.
- The task details screen currently displays only the task title.
- One widget test requires updating to match the redesigned dashboard.

12. Future Enhancements

The following improvements can be considered in future versions:

1. Add local data storage using SharedPreferences or a database.
2. Implement a date picker for selecting task due dates.
3. Complete the edit-task functionality.
4. Display complete task information on the details screen.
5. Add filtering options based on priority and completion status.
6. Improve the testing process and resolve the widget test failure.
7. Add task reminders and calendar integration.

These improvements would make the application more useful for managing academic activities.

13. Author

Bhavya Sri

Department of Computer Science and Engineering
ACE Engineering College, Hyderabad

GitHub: https://github.com/pothireddybhavyasri

LinkedIn: https://www.linkedin.com/in/pothireddy-bhavya-sri-031193328/

---

This project was developed as part of practical learning in Flutter application development. It provided an opportunity to understand how different Flutter concepts work together in building a student-focused application.

License: Not yet specified.
