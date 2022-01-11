Project's Name:
# mp_class_flutterdemo

![UB banner](assets/images/Logo_UB_Tengah.png)

## Description
Just a flutter-dart exercise demo project for Mobile Programming class at Bakrie University.

This demo exercise the usage of:
- Basic flutter app widgets such as layouts, transition, routes, pages, etc.
- Basic navigation menus such as Drawer, TabBar, BottomNavigationBar.
- Basic forms input elements such as TextField, TextFormField, dialogs, etc.
- Basic database CRUD with SQLite and Firebase real-time DB.
- Changing app icon and flutter default white splash screen.

## File structure:
  - assets
    - images
      - (four .png files)
  - lib
    - main.dart
    - main_splash.dart
    - main_screen.dart
    - pages
      - homepage.dart
      - tabbardemo.dart
      - contactview.dart
      - firebasedemo.dart
    - components
      - screens
        - bmicalculator.dart
        - clickcounter.dart
        - entryform.dart
      - helpers
        - sqlitedbhelper.dart
      - models
        - contacts.dart
      - widgets
        - dialogs.dart
        - drawernav.dart
        - layouts.dart

### References:
Some of these codes are taken and modified from these tutorials:
  - https://www.codepolitan.com/mengakses-database-sqlite-dengan-flutter
  - https://medium.flutterdevs.com/explore-realtime-database-in-flutter-c5870c2b231f

### Note:  
  Add your own ***google.services.json*** file (from your firebase account) in to the *"Android\App"* folder. 

## Packages used:
  - [sqflite](https://pub.dev/packages/sqflite)
  - [path_provider](https://pub.dev/packages/path_provider)
  - [firebase_core](https://pub.dev/packages/firebase_core)
  - [firebase_database](https://pub.dev/packages/firebase_database)

# Thanks to Mr. Habibullah Akbar for the lectures

## Official resources on Getting Started with flutter
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
- [Flutter online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.
