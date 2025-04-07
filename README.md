# ☁️ Nimbus

Nimbus is a lightweight and responsive cloud storage app built with **Flutter** and **Firebase**. Designed for speed and simplicity, Nimbus allows users to seamlessly upload, access, and manage their files online — all in real time.

## 🚀 Features

- 🔐 Secure authentication via Firebase Auth
- ☁️ Upload and download files using Firebase Storage
- 🗂️ Store and retrieve file metadata in Firestore
- ⚡ Parallel upload with individual progress tracking
- 🔄 Real-time updates and file visibility
- 📶 Works only with internet connection (no local file persistence)
- 📱 Fully responsive UI

## 📷 Screenshots

_Coming soon..._

## 📦 Tech Stack

- **Flutter** (Frontend)
- **Firebase Auth** (Authentication)
- **Firebase Firestore** (Metadata Storage)
- **Firebase Storage** (File Storage)

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK
- Firebase project configured (Firestore + Storage + Auth)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/DanielArndt0/Nimbus.git
   cd nimbus
   ```
2. Clone the repository:
   ```bash
   flutter pub get
   ```

3. Set up Firebase:
- Add your google-services.json (Android) and GoogleService-Info.plist (iOS)
- Make sure Firestore and Storage rules allow authenticated access

4.Create an env folder and add the file env.local.json with your Firebase config:
```json
{
  "androidApiKey": "androidApiKey",
  "androidAppId": "androidAppId",

  "iosApiKey": "iosApiKey",
  "iosAppId": "iosAppId",
  "iosBundleId": "iosBundleId",

  "messagingSenderId": "messagingSenderId",
  "projectId": "projectId",
  "storageBucket": "storageBucket"
}
```

5.Run the app with environment variables:
```bash
flutter run --dart-define-from-file=env/env.local.json
```

## 📂 Project Structure
```bash
/lib
  ├── App/
  ├── Components/
  ├── Controllers/
  ├── Errors/
  ├── Middlewares/
  ├── Modals/
  ├── Models/
  ├── Providers/
  ├── Screens/
  ├── Services/
  ├── Utils/
  └── main.dart
```

## 🤝 Contributing
Contributions are welcome! Feel free to fork the repo and submit a pull request.

## Built with ❤️ by Daniel Arndt
