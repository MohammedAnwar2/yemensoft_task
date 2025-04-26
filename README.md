Flutter App README 🚀🎈✨
Overview 🌟🌈💖
This Flutter app, built with a Clean Architecture approach, delivers a seamless user experience with a Home Screen that fetches data from an API, saves it to a local database for filtering, and includes a 2-minute session timeout feature to redirect to the Login Screen. 🌻📱 The app integrates a custom Splash Screen and Login Screen, with a modular structure for scalability. 🎉🎊🥳
Software Design Choices 🛠️🔧💡
1. Architecture 🏛️🗼🌍

Clean Architecture: The app follows a Clean Architecture pattern with data, domain, and presentation layers, separated into a features directory. This ensures separation of concerns and testability. 🧩🛠️📐  
Directory Structure: 📂✨  
lib/core/: Shared utilities and constants. 🧰🔩  
lib/api/: API-related services. 🌐📡  
lib/features/: Feature-specific modules (e.g., login, orders, splash). 🖼️📋  
lib/services/: Database and API services. 💾📊  
lib/utils/: Helper classes like session management. 🕒🔒



2. State Management 🧠💭✨

Bloc-Cubit: Chosen for state management due to its strength in handling complex state flows and compatibility with Clean Architecture. 📊📈🌟  
Why Bloc-Cubit?: Provides an organized way to manage app state (e.g., API data, filters) with a clear separation of business logic from the UI. 🚀🎯💼

3. API Integration 🌐📡🚀

Dio: Used in the api layer to fetch data, encapsulated in an ApiRepository for clean data handling. 📡🗂️✨  
Why Dio?: Offers advanced features like request management, cancellation, and easy integration with Clean Architecture compared to the http package. 🚀🔍🌟  
Error Handling: Errors are managed in the data layer with custom exceptions, displayed to users via dialogs or SnackBars. 🚨⚠️💬

4. Local Database 💾📚🗄️

sqflite: Implemented in the data layer for SQLite storage, with a DatabaseRepository to manage data persistence. 📚💿✨  
Why sqflite?: Supports complex queries for filtering and works offline, aligning with Clean Architecture principles. 🗄️🌐💡


5. Session Management ⏳⏰🔒

SessionManager: A utility in utils using a Timer to track inactivity. Redirects to LoginScreen after 2 minutes of no touch or background state. ⏰🚪✨  
Lifecycle Handling: WidgetsBindingObserver in the presentation layer monitors app state changes. 📱🔄  
Why Timer?: Simple, effective, and fits the app's lightweight design. 🌐⏲️💖

6. UI Design 🎨🖌️🌟

Custom Screens: Integrates provided SplashScreen and LoginScreen as entry points, with HomeScreen displaying a filtered ListView.builder. 🖼️📲✨  
Loading States: BlocBuilder handles asynchronous operations for the API and database, using Skeletons (Skletonizer) to display attractive placeholder structures during loading, along with CircularProgressIndicator when necessary. 🌈⏳💫  
Styling: Material Design with custom themes to match the attached design, ensuring consistency. ✨🎀🌼

7. Navigation 🧭🗺️🚀

GoRouter: Used for navigation in the presentation layer, supporting declarative routes for session timeout redirects. 🛤️📍✨  
Why GoRouter?: Offers flexibility and aligns with Clean Architecture for managing navigation logic. 🧭🚀🌟


8. Dependencies 📦🎁🧳

dio: For API calls. 🌐📡  
sqflite: For local storage. 💾📚  
flutter_bloc: For state management using Bloc-Cubit. 🧠📊  
path_provider: For database file access. 🗄️📂  
go_router: For navigation. 🧭🛤️  
skeletons: For displaying placeholder loading structures. ⏳💫  
Kept minimal for performance and simplicity. 🧳✨💡

9. Error Handling & UX 🚑⚠️💬

Layered Errors: Handled at the data layer, propagated to presentation for user feedback. 🚨📢✨  
Offline Support: Local database enables filtering when offline. 📴💾🌟

10. Localization 🌍🔍✅
localization module for multi-language support. 🌍🗣️✨  


Conclusion 🎉🎊🥳
This Clean Architecture-based Flutter app ensures scalability, maintainability, and a great user experience with offline support and session security. Thank you for checking out this project! 😊👍🌟✨
