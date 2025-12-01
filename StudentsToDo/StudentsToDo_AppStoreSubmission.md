# StudentsToDo – App Store Compliance and Metadata

## Part 1 – Compliance Checklist

### A. Privacy and Security Standards

1. **Permissions and sensitive data**
   - The app does not request access to Location, Camera, Microphone, Photos, Bluetooth, Contacts, Calendars, or Health data.
   - No `NSLocationWhenInUseUsageDescription`, `NSCameraUsageDescription`, or similar privacy keys are defined in the Info.plist.
   - The app runs fully offline using local storage only, and does not depend on any online service.

2. **Data storage**
   - User tasks and task groups are stored locally using `UserDefaults` through `JSONEncoder` and `JSONDecoder`.
   - No data is transmitted to external servers or third party services.
   - Deleting the app from the device removes all user task data from local storage.

3. **User identity and tracking**
   - The app does not require a login, account creation, or any form of registration.
   - There is no advertising and no analytics SDK integrated.
   - The app does not track users across apps or websites, so there is no need for App Tracking Transparency prompts.

4. **Security behavior**
   - The app does not execute dynamic code from the network.
   - The app does not install or launch any other executable code.
   - All logic is contained in the compiled Swift code that ships with the app bundle.


### B. Appropriate Content Standards

1. **In-app content**
   - The app UI contains only neutral educational and productivity content for managing tasks and school or personal responsibilities.
   - There is no graphic violence, adult content, hate speech, gambling, or drug related material.
   - Task titles are created by the user and are not prefilled with inappropriate examples.

2. **No misleading behavior**
   - The app does not claim features it does not provide.
   - There are no fake notifications or simulated system alerts.
   - The app name and icon accurately reflect the purpose as a student friendly task tracker.

3. **User generated content**
   - User generated text (task titles) is stored locally and is not shared or published anywhere.
   - Because there is no social sharing feature, the risk of harmful user generated content being shared within the app is minimal.


### C. Design and Human Interface Guidelines

1. **Navigation**
   - The app uses standard SwiftUI navigation patterns, including:
     - A primary list view of task groups.
     - A detail view for the selected group.
     - A separate profile or settings style view for user profile options.
   - Navigation follows a clear hierarchy, so users can always return to the main view using system back navigation.

2. **Controls and button placement**
   - Primary actions such as “Add Group” and “Add Task” are placed in the navigation bar toolbar on the top right, matching Apple’s Human Interface Guidelines.
   - Destructive actions such as deleting a group or task are presented using standard swipe to delete actions or clearly labeled buttons.
   - Tap targets use default SwiftUI button controls, which are large enough for comfortable interaction on iPhone and iPad.

3. **Typography and iconography**
   - The app uses system fonts and dynamic type where possible so text sizes behave consistently with user settings.
   - SF Symbols are used for icons such as the group symbol or plus icon, which keeps the style consistent with system apps.
   - Colors are chosen to keep sufficient contrast between text and background so content remains readable.

4. **Layout consistency**
   - The app keeps alignment consistent within each screen. Titles, lists, and buttons follow a simple column layout.
   - Repeated elements (task rows, group rows) reuse the same cell layout, so users quickly understand how to interact with items.
   - Spacing and padding follow SwiftUI defaults so no controls feel cramped or misaligned.


---

## Part 2 – App Store Metadata Draft

### 1. App Title

**StudentsToDo – Simple Study Task Tracker**


### 2. Description (under 250 words)

StudentsToDo is a simple, focused task manager designed to help students keep track of school work and everyday responsibilities. Organize your homework, projects, and personal errands into clear groups, then check them off as you complete them.

Create custom task groups such as “Math Homework”, “Reading List”, or “Personal Errands” and add tasks with just a few taps. Each group shows you how many tasks you have finished, so you can see your progress at a glance. The app is built with a clean layout that keeps your attention on what matters most: the next task you want to complete.

StudentsToDo stores all of your information on your device. There are no accounts to create and no extra permissions to approve. Open the app, make a list, and start moving through your day with more structure and less stress.

Whether you are managing assignments for school or planning out your personal goals, StudentsToDo helps you turn a scattered list of reminders into a clear and simple plan of action.


### 3. Keywords (at least five)

- student planner  
- homework tracker  
- to do list  
- school organizer  
- study tasks  
- assignment manager  
- checklist  


### 4. Privacy Policy (2–3 sentences)

StudentsToDo stores all task and group information locally on your device using Apple’s system storage. The app does not collect, transmit, or share your data with any third parties. If you delete the app from your device, all stored task data is removed as part of the normal app deletion process.


### 5. Age Rating

**4+**

Reasoning:  
The app contains only general productivity content and simple text input fields. There is no violence, no mature themes, no gambling, and no online interaction, so it is appropriate for users ages four and up according to Apple’s rating categories.
