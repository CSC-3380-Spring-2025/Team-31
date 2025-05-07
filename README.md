# Team 31: Members
Project Manager: Nathan Wandera (pebblion)\
Communications Lead: Temi Odukoya ([GitHub Name])\
Git Master: Aaron Meche (aaron-meche)\
Design Lead: David Vennen (WanderingWizard4)\
Quality Assurance Tester: Ziron Veal ([GitHub Name])

## About Our Software
Inspired by Quizlet, this multi-platform flashcard app lets you create and customize study cards, collaborate with others, test yourself, personalize your learning experience, and track your progress, making it an ideal tool for effective studying across various subjects.

## Important Links
Project Website: [https://flashcard-app-54723.web.app/]
Kanban Board: [https://github.com/orgs/CSC-3380-Spring-2025/projects/25]\
Designs: [link]\
Styles Guide(s): [https://github.com/orgs/CSC-3380-Spring-2025/projects/25]

## Project File Structure
- **android/, ios/, macos/, windows/, linux/, web/**: Platform-specific code and configurations.
- **build/**: Contains build outputs (usually hidden or ignored).
- **lib/**: Core Dart/Flutter source code.
- - **main.dart**: Main entry point file for application.
- - **src/**
- - - **screens/**: Screen layouts for different pages
- - - **widgets/**: Custom widgets to be imported

___
tgfhyv
## Project File Structure
- **android/, ios/, macos/, windows/, linux/, web/**: Platform-specific code and configurations.
- **build/**: Contains build outputs (usually hidden or ignored).
- **lib/**: Core Dart/Flutter source code.
- - **main.dart**: Main entry point file for application.
- - **src/**
- - - **screens/**: Screen layouts for different pages
- - - **widgets/**: Custom widgets to be imported

---

## Flutter Setup (Mac)
1. Install Flutter from [flutter.dev](https://flutter.dev).
2. Run `flutter doctor` to check dependencies.
3. Use `flutter pub get` to install required packages.
4. For iOS, ensure you have Xcode installed and use `flutter run` to launch the app.

---
## Flutter Setup (Android Emulation)
In order to access an important feature of the app (Image to text). running the app on an android emulator is required.
1. Download Android Studio from https://developer.android.com/studio
2. Open Android Studio and navigate to the SDK Manager
3. Go to SDK Tools and make sure Command-line Tools are installed ![studio64_5xu303a8w5](https://github.com/user-attachments/assets/b0e168c6-1b3e-4a22-a016-3d4c363836e4)

4. Open the flutter project in Visual Studio code.
5. Run `flutter doctor` in the vscode terminal to check if Android Studio and Android Toolchain are installed ![image](https://github.com/user-attachments/assets/110a940c-6d2e-4144-a6f4-961c44eae691)

6. In the bottom right corner there is an option to select a device. The options should be your current OS, Chrome, and an Android device (if android studio is installed)
7. Clicking the android device should open the emulator ![Code_eDAgGUmJty](https://github.com/user-attachments/assets/1bb0b61a-f778-41cc-87df-afa3a578ccf4)
8. Now using `flutter run` should launch the app inside of the android emulator
   
# Code Design Standards
This section outlines the code design standards for our Flutter project, focusing on the organization and structure of the core Dart files within the main `lib/` directory. These guidlines are intended to ensure consistent code standards, modularlity, and maintainability across the entire codebase.


## lib/ Folder Structure
All dart files are located within the `lib/` directory.

**lib/main.dart**
The application’s entry point, responsible for initializing the app, defining the UI structure, and configuring page routing.

**lib/src/**
The core directory for all supporting Dart code, housing subfolders for screens, widgets, and templates.

**lib/src/screens/**
Contains screen (page) files representing distinct UI views. 
See [Screen Files](#screen-files) for more information.

**lib/src/templates/**
Holds reference template files for consistent file structure and design practices, used solely during development.
See [Template Files](#template-files) for more information.

**lib/src/widgets/**
This subfolder holds all reusable, importable widgets. While most widgets start in screen-specific files, refactor them here (e.g., `widgets/custom_nav_button.dart`) if they can be reused across screens. Aim for modularity and DRY (Don’t Repeat Yourself) code. 
See [Widget Files](#widget-files) for more information.


## File Standards
All `.dart` files should contain a commented header containing the file name and a short file description. Add 1 line padding to the top and bottom of file headers, skipping a line between file name and description.

**Example File Header:**
`// `
`// file_name.dart`
`// `
`// Short description of file purpose / contents`
`// `

### Screen Files
All screen files should be located in `lib/src/screens/`
**File Names:**: lowercase_with_userscores (e.g. `home_screen.dart`)
**Class Names:**: UpperCamelCase (e.g. `class HomeScreen extends StatelessWidget {`)
**Template Files:**: 
- See `lib/src/templates/template_screen.dart` for commented template
- See `lib/src/templates/template_empty_screen.dart` for empty template

### Widget Files
All widget files should be located in `lib/src/widgets/`
**File Names:**: lowercase_with_userscores (e.g. `custom_nav_button.dart`)
**Class Names:**: UpperCamelCase (e.g. `class CustomNavButton extends StatelessWidget {`)
**Template Files:**: 
- See `lib/src/templates/template_widget.dart` for commented template + examples
- See `lib/src/templates/template_empty_widget.dart` for empty template