# Experiment 8: Animations

## Aim
To enhance user experience by adding subtle, meaningful animations to UI components.

## Objectives
- Implement fade animations using `AnimatedOpacity`.
- Implement slide animations using `AnimatedPositioned`.
- Use `AnimatedContainer` for layout and color transitions.
- Ensure animations are simple and don't overwhelm the interface.

## Flutter Concepts Used
- Implicit Animation Widgets
- `AnimatedOpacity`
- `AnimatedPositioned`
- `AnimatedContainer`

## Implementation
The `TaskCard` widget was updated to include implicit animations. When a task is marked as completed, `AnimatedOpacity` gently fades the entire card to a lower opacity. Simultaneously, the background decoration transitions smoothly using an `AnimatedContainer`. Finally, `AnimatedPositioned` slides the watermark image slightly to indicate state change without jarring the user. 

## Testing
Widget tests were updated to pump frames (`pumpAndSettle`) when a task is completed, verifying that the widget tree transitions correctly through the animation frames without layout errors.

## Result
Smooth, non-intrusive animations successfully implemented for task state changes.
