# project set up
1.  In your vscode, press `ctrl+shift+p` and type `flutter` to open the Flutter extension.
2. Name your project and press enter.
3. Select the folder where you want to create the project.
4. Finally, name your project and press enter.
5. You are ready to go!

# assumptions
1. **Firestore Collections and Data Structure**:
   - The `brands` collection contains documents with a `name` field representing different brand names.
   - The `products` collection contains documents with fields like `title` (representing product names) and `b_id` (representing brand identifiers).

2. **Firestore Integration**:
   - Firebase Firestore is correctly set up and initialized in your Flutter project. This includes proper configuration for both android and iOS in the `google-services.json`  and 'GoogleService-Info.plist' files, initialization in the `main.dart`, and correct dependencies added in `pubspec.yaml`.

### State Management
1. **ValueNotifier Usage**:
   - `ValueNotifier<String>` is used to manage and notify changes. It is assumed that this notifier will trigger UI updates whenever the brand name changes.

# challenges
1. Since I lacked prior experience with database tables and Firebase DB, I encountered difficulties initially in creating tables using Firebase. However, through research and a trial-and-error approach, I eventually succeeded in displaying some data using Firebase DB.

2. Despite juggling my current job and college commitments, I faced time constraints while working on this project. However, I managed to allocate a dedicated three-hour window for the project. Despite these challenges, I successfully completed 60% of the work by prioritizing tasks effectively and focusing intensely during the available time.