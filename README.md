<div align="center">

<img src="lib/assets/images/leaf.png" alt="CarePoint logo" width="96" />

# CarePoint

### Safe Space.

A Flutter mobile app built from my own Figma design, made a year ago.
Assisted by Claude and my imagination.

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/State-GetX-8A2BE2)

</div>

---

## About

CarePoint is a personal project that turns my old Figma design into a working Flutter app.
The goal is a calm, clean, and friendly interface — a safe space.

> **Status:** work in progress. This is a mock / learning project.

## Features

- **Splash screen** with an automatic transition to the login page
- **Login flow** with a form (username and password) connected to a REST API
- **Loading state** on the login button while the request is running
- **Floating bottom navigation** with an iPhone-style sliding indicator
- **Menus:** Home, Tips, Chat, and Profile
- **Reusable components:** buttons and text fields that can be used across pages

## Tech Stack

| Area | Tools |
|---|---|
| Framework | Flutter (Dart) |
| State management and routing | [GetX](https://pub.dev/packages/get) |
| Networking | [http](https://pub.dev/packages/http) |
| Fonts | Plus Jakarta Sans, Prata, Poppins |
| Design | Figma |

## Project Structure

```
lib/
├── assets/
│   ├── fonts/          # Plus Jakarta Sans, Prata, Poppins
│   └── images/         # logo and other images
├── components/
│   ├── button.dart             # CustomOperatorButton
│   ├── textfield.dart          # CustomTextfield
│   └── custom_bottom_bar.dart  # floating bottom navigation
├── controller/
│   ├── splash_controller.dart
│   ├── login_controller.dart
│   ├── form_login_controller.dart
│   └── bottom_bar_controller.dart
├── menu/
│   ├── home_menu.dart
│   ├── tips_menu.dart
│   ├── chat_menu.dart
│   └── profile_menu.dart
├── models/             # data models (e.g. login response)
├── pages/
│   ├── splash_page.dart
│   ├── login_page.dart
│   ├── form_login.dart
│   └── home_page.dart
├── routes.dart         # named routes (GetX)
└── main.dart
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- An emulator, a physical device, or Chrome

### Run locally

```bash
# 1. Clone the repository
git clone https://github.com/raymndusArya/CarePoint-mock.git
cd CarePoint-mock

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

> **Note:** when running on Chrome, API requests may be blocked by CORS.
> Use an emulator or a physical device to test the login.

## Design

The UI follows my Figma design:

- **Background:** `#E8EEFC`
- **Primary green:** `#4A6659`
- **Link blue:** `#007AFF`
- **Typography:** Plus Jakarta Sans for the interface, Prata for accents


## Roadmap

- [ ] Real content for Home, Tips, Chat, and Profile
- [ ] Register page
- [ ] Forgot password
- [ ] Input validation and error states
- [ ] Persistent login session

## Credits

Made by **Leaf Team**. Designed in Figma, built with Flutter, and assisted by claude.

## Learn More

If this is your first Flutter project, these resources help:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter documentation](https://docs.flutter.dev/)
