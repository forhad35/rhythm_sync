# 📱 RhythmSync

> A Flutter mobile app to help users sync with nature’s rhythm by setting personalized alarms based on their location.  
> Built with clean architecture and GetX for state management.

---

## 🛠️ Tech Stack & Dependencies

### ✅ Main Dependencies

| Package                       | Description                               |
|------------------------------|-------------------------------------------|
| `get`                        | State management & routing (GetX)         |
| `flutter_local_notifications`| Local notifications for alarms            |
| `geolocator`                 | Get user's current location               |
| `geocoding`                  | Convert coordinates to human-readable address |
| `intl`                       | Format and display dates & times          |
| `hive` + `hive_flutter`      | Lightweight local database (alarms)       |
| `shared_preferences`         | Persistent key-value storage              |
| `flutter_switch`             | Custom switch UI                          |
| `android_alarm_manager_plus` | Background alarm manager (optional)       |
| `timezone`                   | Schedule alarms accurately with time zone |
| `path_provider`              | Get platform directories for storage      |

---

## 🔤 Fonts Used

| Font Family | Weights Used                    |
|-------------|---------------------------------|
| **Oxygen**  | Regular, Bold, Light            |
| **Poppins** | Regular, Bold, Light            |

Ensure these are placed in `assets/fonts/` and declared in `pubspec.yaml`.

---

## 📁 Project Structure (Clean Architecture)

```
lib
├── common_widgets
├── constants
│   └── route
│       ├── app_routes.dart
│       └── page_route.dart
├── features
│   ├── alarm
│   │   ├── controller
│   │   │   └── alarm_controller.dart
│   │   ├── model
│   │   │   ├── alarm_model.dart
│   │   │   └── alarm_model.g.dart
│   │   └── service
│   │       └── alarm_service.dart
│   ├── home
│   │   └── view
│   │       └── home_screen.dart
│   ├── location
│   │   └── view
│   │       └── location_screen.dart
│   └── onboarding
│       ├── controller
│       │   └── onboarding_controller.dart
│       ├── model
│       │   └── onboarding_model.dart
│       └── view
│           └── onboarding_screen.dart
├── generated
│   └── assets.dart
├── helpers
├── main.dart
└── networks
    └── get_current_location.dart

```

---

## 📸 Screenshots 

| Onboarding , Location Access, Alarm List |
| !([https://github.com/forhad35/rhythm_sync/blob/main/assets/ProjectScreenshot%20.png]) | 
---

## 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/your-username/rhythm_sync.git
cd rhythm_sync

# Get dependencies
flutter pub get

# Generate Hive type adapters (if needed)
flutter pub run build_runner build

# Run the app
flutter run
```

---

## ⚙️ Platform-specific Setup

### ✅ Android (AndroidManifest.xml)

```xml
<uses-permission android:name="android.permission.WAKE_LOCK"/>
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/>
```

Inside `<application>` tag:

```xml
<receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver" android:exported="true"/>
<receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver" android:exported="true"/>
```

Also ensure `app_icon.png` is placed in `android/app/src/main/res/drawable/`.

---

## 🧪 Dev Tools

| Tool               | Purpose                              |
|--------------------|---------------------------------------|
| `flutter_test`     | Unit/widget testing                   |
| `build_runner`     | For code generation (Hive adapter)    |
| `hive_generator`   | To generate type adapters             |
| `flutter_lints`    | Linting and best practices            |

---


