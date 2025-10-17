
# 💸 Expense Tracker App

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue?logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-2.17+-blue?logo=dart)](https://dart.dev/)
[![SQLite](https://img.shields.io/badge/Database-SQLite-orange?logo=sqlite)](https://www.sqlite.org/)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## 🧾 Description

The **Expense Tracker App** is a Flutter-based mobile application that helps users manage and visualize their daily income and expenses.  
Built with **Dart**, **Flutter**, and **SQLite local storage**, it works entirely **offline** and provides an intuitive interface for adding, viewing, and analyzing financial transactions.

---

## ✨ Features

- 🕐 **Splash Screen** – Appears only once during the first launch.  
- 👤 **Profile Setup** – Add your name, contact number, and profile photo.  
- 🏠 **Dashboard** – Displays total balance, total income, total expenses, and recent transactions.  
- ➕ **Add Transactions** – Quickly record new income or expense entries.  
- 🗑️ **Edit/Delete Transactions** – Manage existing transactions with ease.  
- 📊 **Expense Statistics** – View detailed insights of what percentage each expense holds.  
- 💾 **Local Data Storage** – Data is securely stored offline using SQLite.  
- 🧮 **Separate Transactions Page** – Displays a complete list of all transactions.  
- 🔄 **Profile Management** – Update your name, photo, or log out anytime.  

---

## 🛠️ Tech Stack

- **Language:** Dart  
- **Framework:** Flutter  
- **Database:** SQLite  
- **Storage:** Local (on-device)  
- **State Management:** (based on your implementation, e.g., setState / Provider / Riverpod)

---

## 📱 Screenshots

![home_page](https://github.com/user-attachments/assets/b3181741-c091-4640-946c-4f7e07b26b41)
![stats2](https://github.com/user-attachments/assets/09ee9542-7a3a-487a-9332-585d54f104e7)
![stats](https://github.com/user-attachments/assets/3ed2323c-5ad2-458d-a995-320c227d6d8c)


> 📸 Place your screenshots in a `/screenshots` folder inside the project directory for them to appear above.

---

## 🚀 Getting Started

Follow these steps to set up and run the project locally:

1.  **Clone the repository**
   ```bash
   git clone https://github.com/uttkarsh-dixit/expense-tracker.git

2.  **Navigate to the project directory**
	cd expense-tracker

3. **Install dependencies**
	flutter pub get

4. **Run the app**
	flutter run

```

```bash
##  📂 Folder Structure
lib/
 ┣ 📁 database_services/
 ┃ ┗ database_services.dart
 ┣ 📁 db_table/
 ┃ ┗ transaction_table.dart
 ┣ 📁 screens/
 ┃ ┣ add_transaction.dart
 ┃ ┣ home_screen.dart
 ┃ ┣ profile_screen.dart
 ┃ ┣ profile_setup_screen.dart
 ┃ ┣ splash_screen.dart
 ┃ ┣ stats_screen.dart
 ┃ ┗ transactions_screen.dart
 ┣ 📁 widgets/
 ┃ ┣ transactions_card.dart
 ┃ ┗ transactions_tile.dart
 ┗ main.dart

```

## 🔮 Future Improvements
* ☁️ Integrate cloud sync (Firebase)
* 🌙 Add dark mode support
* 📤 Export transactions as PDF or CSV
* 💬 Add user-defined categories for expenses
* 🧠 Add AI-based spending insights or budgeting suggestions



##  🤝 Contributing
Contributions, issues, and feature requests are welcome!
To contribute:
1. Fork the repository
2. Create a new branch (feature/your-feature-name)
3. Commit your changes
4. Open a Pull Request


## 👨‍💻 Author
Uttkarsh Dixit 📧 dixituttkarsh5@gmail.com 🔗 [Linkedin](https://www.linkedin.com/in/uttkarsh-dixit/)  | [GitHub](https://github.com/uttkarsh-dixit)


⭐ If you found this project helpful, please consider giving it a star!
