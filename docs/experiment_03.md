# Experiment 3: Responsive UI

## Aim
To implement a responsive and adaptive user interface for the Student Task Manager that scales gracefully across devices (phones, tablets) and orientations (portrait, landscape).

## Objectives
- Use `MediaQuery` to adjust layout proportions dynamically based on screen size.
- Use `LayoutBuilder` to conditionally display widgets based on available constraints.
- Adjust layout configurations for `Orientation`.
- Utilize `Expanded` to prevent UI overflow.

## Flutter Concepts Used
- `MediaQuery`
- `LayoutBuilder`
- `OrientationBuilder` / `Orientation`
- `Expanded` and `Flexible`

## Implementation
The `HomeScreen` was updated to be responsive. A `LayoutBuilder` wraps the main content to switch between a list view (phone) and a grid view (tablet) depending on the maximum width. `MediaQuery` is used to determine padding and sizing for the `TaskCard` dynamically. `OrientationBuilder` adjusts the layout for portrait vs. landscape views to prevent overflow. 

## Testing
Verified responsiveness by running widget tests with different screen size simulated environments.

## Result
The UI is fully responsive, supporting different form factors without layout overflow errors.
