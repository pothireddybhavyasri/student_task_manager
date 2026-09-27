# Experiment 7: Forms and Validation

## Aim
To create interactive forms for data entry and validate user inputs safely.

## Objectives
- Build an Add/Edit Task form.
- Use `Form`, `GlobalKey<FormState>`, and `TextFormField`.
- Implement validation logic for required fields and specific constraints.
- Display contextual error messages directly in the UI.

## Flutter Concepts Used
- Form Widgets (`Form`, `TextFormField`, `DropdownButtonFormField`)
- Validation functions
- `GlobalKey<FormState>` state access

## Implementation
Replaced the placeholder in `AddTaskScreen` with a fully functional `Form`. Created distinct fields for the task title, description, priority (dropdown), and due date. Implemented `onSaved` callbacks to populate the task properties before dispatching the new task to the `TaskProvider`. 

## Testing
Widget tests verify that submitting an empty form triggers the expected validation error messages (e.g., "Please enter a task title"). Also tests valid form submission.

## Result
User input is securely captured and validated without external database dependencies.
