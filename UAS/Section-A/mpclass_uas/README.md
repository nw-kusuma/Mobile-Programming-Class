## **Project's Name:**
# mpclass_uas

## **Description**
A flutter-dart demo project as a code companion for **Mobile Programming** class final/end-term exam at **Bakrie University**.

This project demonstrate how:
- The basic transition or switching between screens are done.
- The basic navigation and menus such as Drawer, TabBar, BottomNavigationBar are implemented.
- The basic database CRUD operation with Firebase real-time DB.
- The basic forms input elements such as TextFormField, DropDownButtonForm Field, dialogs, etc.
- To changes the app-icon and flutter default white splashscreen.
---
## **File structure:**
### Assets:
  - assets
    - images
      - *contains .png logo image files used in this project*
  - android\app\src\main\res
    - drawable-xxxx    <-- (*several directories for each resolution splash-screen image*) 
      - splash.png
    - mipmap-xxxx    <-- (*several directories for each resolution app-icon*) 
      - ic_launcher.png
#### Note:  
- You can create the app-icons using [Image Asset Studio](https://developer.android.com/studio/write/image-asset-studio) in AndroidStudio.
- However, that option above didn't appear when I open this flutter projects in AndroidStudio, so I created it using Adobe XD and export it as PNG with Android option selected, which automatically export them in various resolution (placed under different directories named drawable-xxxx).

### Dart codes:
  - lib
    - main.dart    <-- *project's main class, also contain class for main-screen.*
    - export_packages.dart    <-- *placeholders for the packages used in the projects, just to simplify the **import** section in each other files.*
    - export_screens.dart     <-- *placeholders for the screens files, same reasons as above.*
    - export_widgets.dart     <-- *placeholders for the custom widgets, helpers, constants, etc.*
    - screens
      - home_page.dart
      - switch_page.dart
      - navigation_page.dart
      - database_page.dart
      - examples
        - switch_example.dart
        - navigation_example.dart
        - database_example.dart
    - components
      - body_background.dart
      - nav_apptopbar.dart
      - nav_bottombar.dart
      - nav_drawermenu.dart
      - nav_fabmenu.dart
      - widgets_builder.dart
      - firebase_helper.dart
---
## **Firebase RT DB structure:**
  - roots db
    - Students
      - id
        - name
        - email
        - subject
          - subject-id
            - desc
            - grade
    - Subjects
    - Grades
#### Note:  
- See the [screenshot images of the database](../screenshots/database/) in the screenshots directory.
- Also, add your own ***google.services.json*** file (downloaded from your firebase account) in to the "***android\app***" directory. 
---
## **Packages used:**
  - [firebase_core](https://pub.dev/packages/firebase_core)
  - [firebase_database](https://pub.dev/packages/firebase_database)
  - [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
  - [curved_navigation_bar](https://pub.dev/packages/curved_navigation_bar)
---
# Thanks to Mr. Habibullah Akbar for the lectures

![UB banner](assets/images/Logo_UB_Tengah.png)

## **Official links for more resources and on Getting Started with flutter**
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
- [Flutter online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.
---
