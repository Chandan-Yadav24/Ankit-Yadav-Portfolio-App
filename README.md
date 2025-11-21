# Ankit Yadav Portfolio App

A beautiful, responsive Flutter portfolio application showcasing professional experience, education, skills, and contact information.

## Features

- **Splash Screen** - Elegant app introduction
- **Home Screen** - Professional profile overview
- **About Section** - Personal background and introduction
- **Experience** - Work history and professional achievements
- **Education** - Academic qualifications and certifications
- **Hobbies** - Personal interests and activities
- **Contact** - Easy ways to get in touch
- **Responsive Design** - Optimized for mobile, tablet, and web
- **Custom Fonts** - Poppins font family for modern aesthetics
- **URL Launcher** - Direct links to social profiles and contact methods

## Tech Stack

- **Framework**: Flutter 3.7.2+
- **Language**: Dart
- **UI**: Material Design
- **Key Dependencies**:
  - `google_fonts` - Typography
  - `url_launcher` - External link handling
  - `flutter_launcher_icons` - App icon management

## Project Structure

```
lib/
├── core/
│   ├── colors.dart       # Color palette
│   ├── constants.dart    # App constants
│   └── theme.dart        # Theme configuration
├── data/
│   ├── models/           # Data models
│   └── dummy_data.dart   # Sample data
├── routes/
│   └── app_routes.dart   # Navigation routes
├── ui/
│   ├── layout/           # Layout components
│   ├── screens/          # App screens
│   └── widgets/          # Reusable widgets
└── main.dart             # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK 3.7.2 or higher
- Dart SDK
- Android Studio / Xcode (for mobile development)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd Flutter\ Portfolio\ app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Build for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

## Customization

### Update Profile Information
Edit `lib/data/dummy_data.dart` to add your personal information, experience, education, and hobbies.

### Modify Theme
Update colors and styling in:
- `lib/core/colors.dart` - Color definitions
- `lib/core/theme.dart` - Theme configuration

### Add Assets
Place images in `assets/images/` and fonts in `assets/fonts/`

## Dependencies

- **google_fonts** (^6.1.0) - Google Fonts integration
- **url_launcher** (^6.2.5) - Open URLs and contact methods
- **flutter_launcher_icons** (^0.13.1) - App icon generation
- **cupertino_icons** (^1.0.8) - iOS-style icons

## Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Material Design Guidelines](https://material.io/design)

## License

This project is open source and available under the MIT License.

## Author

**Chandan Kumar Yadav**

For inquiries or collaboration, please use the contact section in the app.
