# Experiment 9: REST API Integration

## Aim
To fetch, parse, and display data from an external REST API using asynchronous Dart concepts.

## Objectives
- Integrate the `http` package.
- Parse JSON data using `dart:convert`.
- Create a data model (`ApiUser`) for the remote data.
- Display the fetched data in a `ListView` using a `FutureBuilder`.

## Flutter Concepts Used
- `http` package
- JSON Serialization (`fromJson`)
- `FutureBuilder`
- Asynchronous programming (`async`/`await`)

## Implementation
Added the `http` dependency to `pubspec.yaml`. Created an `ApiUser` model in `lib/models/api_user.dart`. Replaced the placeholder in `ApiDemoScreen` with a `FutureBuilder` that makes an asynchronous GET request to `https://jsonplaceholder.typicode.com/users`. The screen properly handles loading, error, and loaded states, displaying the results in a `ListView`. This feature is intentionally kept separate from the main Task Manager state to maintain app simplicity.

## Testing
Widget tests navigate to the API screen and verify that the `CircularProgressIndicator` appears during the loading state, and gracefully transitions to an error state since real HTTP requests are blocked in the test environment.

## Result
External API data is successfully consumed and rendered asynchronously.
