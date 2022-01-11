**Project's Name:**
---
# mp_class_flutterdemo

**Description**
---
Just a flutter-dart exercise demo project for Mobile Programming class at Bakrie University.

![UB banner](assets/images/Logo_UB_Tengah.png)

This demo exercise the usage of:
- Basic flutter app widgets such as layouts, transition, routes, pages, etc.
- Basic navigation menus such as Drawer, TabBar, BottomNavigationBar.
- Basic forms input elements such as TextField, TextFormField, dialogs, etc.
- Basic database CRUD with SQLite and Firebase real-time DB.
- Changing app-icon and flutter default white splashscreen.

**File structure:**
---
### Image assets: 
  - assets
    - images
      - *contains .png image files used throughout this project*
  - android\app\src\main\res
    - mipmap-xxxx --> (*several directories for various resolution app-icon*) 
      - ic_launcher.png
#### Note:  
- You can create the app-icons using Image Asset Studio in AndroidStudio.
- However, that option above didn't appear when I open this flutter projects in AndroidStudio, so I created it using Adobe XD and export it as PNG with Android option selected, which automatically export them in various resolution (placed under different directories named drawable-xxxx).
- Also, add your own ***google.services.json*** file (downloaded from your firebase account) in to the "***android\app***" directory. 

### Dart codes:
  - lib
    - main.dart
    - main_screen.dart
    - ~~main_splash.dart~~ --> (update: *I use flutter_native_splash package instead of this*)
    - pages
      - basicnavdemo.dart
      - firebasedemo.dart
      - sqlitedemo.dart
    - components
      - screens
        - bmicalculator.dart
        - clickcounter.dart
        - entryform.dart
        - landingpage.dart
      - helpers
        - sqlitedbhelper.dart
      - models
        - sqlitedata.dart
        - firebasedata.dart
      - routes
        - drawernav.dart
        - routegenerator.dart
      - widgets
        - dialogs.dart
        - forms.dart
        - layouts.dart
#### References:
Some of these codes are taken and modified from these tutorials:
  - https://www.codepolitan.com/mengakses-database-sqlite-dengan-flutter
  - https://medium.flutterdevs.com/explore-realtime-database-in-flutter-c5870c2b231f

**Packages used:**
---
  - [sqflite](https://pub.dev/packages/sqflite)
  - [path_provider](https://pub.dev/packages/path_provider)
  - [firebase_core](https://pub.dev/packages/firebase_core)
  - [firebase_database](https://pub.dev/packages/firebase_database)
  - [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)

# Thanks to Mr. Habibullah Akbar for the lectures

**Official resources on Getting Started with flutter**
--
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
- [Flutter online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.
