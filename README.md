# Task Management App

A simple task management app built with Flutter and Firebase Realtime Database. The app allows users to create tasks, mark them as complete/incomplete, and view them in real time.

## Features
- **Task List:** Displays a list of tasks retrieved from Firebase.
- **Add Tasks:** Users can create tasks with a title and optional description.
- **Task Status:** Tasks can be marked as complete or incomplete.
- **Real-Time Updates:** Task list updates instantly when changes occur in Firebase.
- **Filtering:** Users can filter tasks (All, Completed, Incomplete).
- **State Management:** Uses an `InheritedWidget`-based provider for efficient state management.
- **Offline Support:** Firebase Realtime Database persistence is enabled.
- **Anonymous Authentication:** The app uses **Firebase Anonymous Authentication** to manage users without requiring login. Firebase automatically creates a unique user ID for each session.

---

## Running an application

You can download apk from [Releases](https://github.com/eeeedgar/pondo_flutter_intro/releases) or build it by yourself

### 🛠️ Setup and Installation

#### **1. Clone the repository**
```bash
git clone git@github.com:eeeedgar/pondo_flutter_intro.git
cd pondo_flutter_intro
```
#### **2. Setup and run apk**
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run -d android
```

### **Project structure**
```
lib
├── core
│   ├── theme
│   │   ├── theme_controller.dart
│   │   ├── theme_dark.dart
│   │   ├── theme_light.dart
│   │   └── widgets
│   │       └── custom_app_bar.dart
│   └── widgets
│       ├── auth_wrapper.dart
│       └── authorized_area.dart
├── di
│   └── app_dependencies.dart
├── feature
│   ├── auth
│   │   ├── data
│   │   │   ├── auth_repository.dart
│   │   │   └── auth_repository_impl.dart
│   │   ├── provider
│   │   │   └── auth_provider.dart
│   │   └── view
│   │       └── auth_sign_in_anonymous_screen.dart
│   └── task
│       ├── data
│       │   ├── dto
│       │   │   ├── task_create_dto.dart
│       │   │   ├── task_create_dto.freezed.dart
│       │   │   └── task_create_dto.g.dart
│       │   ├── task_repository.dart
│       │   └── task_repository_impl.dart
│       ├── model
│       │   ├── task_complete_status.dart
│       │   ├── task_model.dart
│       │   ├── task_model.freezed.dart
│       │   └── task_model.g.dart
│       ├── provider
│       │   └── task_list_provider.dart
│       └── view
│           ├── screens
│           │   ├── task_create_screen.dart
│           │   └── task_list_screen.dart
│           └── widgets
│               └── task_list_tile.dart
├── firebase_options.dart
├── main.dart
├── project_structure.txt
└── router
    └── routes.dart

20 directories, 28 files

```

### **Running tests**

Tests are running automatically on CI/CD, but you can run them on your own
```bash
flutter test
```

This will run unit tests, including:
- Task operations
- Firebase repository mock testing

### **Architecture & Design Patterns**

The app follows a modular and scalable architecture:

1. Provider-based State Management
    - Uses an InheritedWidget-based TasksProvider for managing the task list and filtering state.
	- Centralized state handling ensures real-time UI updates.

2. Separation of Concerns (SoC)
    Dividing modules into layers:
    - data
    - model
    - provider
    - view
