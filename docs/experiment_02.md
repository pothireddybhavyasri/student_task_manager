# Experiment 2: Flutter Widgets and Layouts

## Aim
To design and build the primary user interface for the Student Task Manager using core Flutter widgets and layout structures.

## Objectives
- Use basic widgets (Text, Icon, Image, Container, ElevatedButton).
- Construct layouts using Row, Column, and Stack.
- Build the main Home Screen with a custom AppBar, task count, and task cards showing priority, due date, and completed status.

## Flutter Concepts Used
- Structural widgets (Container, AppBar, Scaffold)
- Layout widgets (Row, Column, Stack)
- UI elements (Text, Icon, ElevatedButton)
- Asset/Network Images (Image)

## Implementation
Created a HomeScreen utilizing Column to stack the task count and the task list. A custom TaskCard widget was implemented using a Container with a Row to display task details, an Icon for status, and a Stack to overlay priority indicators. An ElevatedButton was added for the "Add Task" action. 

## Testing
Widget tests were updated to ensure the presence of newly added widgets (e.g., ElevatedButton, TaskCard elements). Verified no layout overflow errors occurred on standard screen sizes.

## Result
The static layout for the Student Task Manager was successfully constructed using fundamental Flutter widgets.
