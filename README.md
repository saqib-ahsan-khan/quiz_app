# Simple Quiz App (Flutter)

Minimal quiz app demonstrating state and time-based UI with navigation.

## Features

- 5 MCQs shown one-by-one
- 4 options per question
- 10-second countdown per question with auto-skip
- Final score displayed at the end
- Navigation: Home -> Quiz -> Result

## How to Run

```bash
flutter pub get
flutter run
```

## Screenshots

Add screenshots here:

- Home Screen
- Quiz Screen (timer visible)
- Result Screen

## Tech Notes

- State management via StatefulWidget and setState
- Timer from `dart:async` to implement countdown and auto-skip
- Simple Navigator routes for screen transitions
