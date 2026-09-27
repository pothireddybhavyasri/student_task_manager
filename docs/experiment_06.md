# Experiment 6: Custom Widgets and Themes

## Aim
To improve modularity and visual consistency by extracting UI components into reusable custom widgets and applying global themes.

## Objectives
- Create reusable `TaskCard`, `PriorityChip`, `StatusChip`, and `CustomButton` widgets.
- Define and apply a Light Theme and a Dark Theme.
- Refactor existing screens to use the new custom widgets.

## Flutter Concepts Used
- Widget Extraction and Composition
- `ThemeData` and `ColorScheme`
- `brightness` configuration (Light/Dark Mode)

## Implementation
Extracted UI components into dedicated files in `lib/widgets`. Replaced raw UI elements in `HomeScreen` with `TaskCard` and `CustomButton`. Created `lib/utils/themes.dart` containing `AppThemes.lightTheme` and `AppThemes.darkTheme`, which were applied to `MaterialApp` in `main.dart` (supporting system theme changes).

## Testing
Widget tests were refactored to verify the presence of `CustomButton` and `TaskCard` by their types. Confirmed widgets render properly under both light and dark constraints.

## Result
Code modularity is improved, and the application now supports dynamic theming.
