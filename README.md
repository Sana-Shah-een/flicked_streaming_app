# 🎬 Flicked - Flutter Movie Streaming App

[![Flutter](https://img.shields.io/badge/Flutter-v3.x-blue.svg?logo=flutter)](https://flutter.dev)  
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)  
[![Riverpod](https://img.shields.io/badge/Riverpod-State_Management-green.svg)](https://riverpod.dev)

**Flicked** is a sleek and responsive Flutter-based movie streaming application delivering real-time content sourced from **The Movie Database (TMDb)**. With intuitive navigation and a clean UI, users can seamlessly browse categories such as *Now Playing*, *Top Rated*, and *Upcoming*, along with advanced search capabilities. Designed following clean architecture principles and powered by **Riverpod**, Flicked prioritizes scalability, performance, and maintainability.

---

## 🚀 Features

- 🎥 Real-time movie content integration via the [TMDb API](https://www.themoviedb.org/documentation/api)
- 🌐 Responsive UI optimized for diverse screen sizes and device types
- 🔁 Infinite scrolling for smooth, dynamic content loading
- 🔎 Advanced search with filter-based result refinement
- 🎨 Dynamic blurred background adapting to the current movie poster
- 🧩 Modular and maintainable codebase adhering to clean architecture best practices
- ⚙️ Efficient and testable state management implemented using Riverpod

---

## 🧱 Architecture Overview

Flicked employs a **clean architecture** framework to ensure separation of concerns and maintainable code:

- **Presentation Layer:** Flutter widgets and UI components  
- **Application Layer:** State management facilitated by Riverpod  
- **Data Layer:** Handles API interactions and response processing  
- **Domain Layer:** Defines models and encapsulates business logic  

This architectural approach fosters scalability, testability, and ease of future enhancements.

---

## 🛠️ Tech Stack

<p align="center">

| Technology              | Role                                      |
|-------------------------|-------------------------------------------|
| **Flutter**             | Cross-platform UI toolkit                 |
| **Dart**                | Primary programming language              |
| **Riverpod**            | State management                          |
| **HTTP**                | Networking and API requests               |
| **TMDb API**            | Movie content provider                    |
| **Material UI**         | Native mobile design system               |
| **VS Code / Android Studio** | Integrated development environments |

</p>

---

## 📁 Folder Structure

```bash
lib/
├── controllers/
│   └── main_page_data_controller.dart     # Business logic for main page
├── models/
│   ├── app_config.dart                     # Application-level configurations
│   ├── main_page_data.dart                 # Data model for main page sections
│   ├── movie.dart                          # Movie data structure
│   └── search_category.dart                # Search filters and categories
├── pages/
│   ├── main_page.dart                      # Main movie listing UI
│   └── splash_page.dart                    # Splash screen UI
├── provider/
│   └── main_page_provider.dart             # Riverpod state management setup
├── services/
│   ├── http_service.dart                   # API client setup and configuration
│   └── movie_service.dart                  # Movie-specific API request handlers
├── widgets/
│   └── movie_tile.dart                     # Movie display widget
└── main.dart                              # Application entry point
## 🔗 Repository

Access the complete source code and contribute here:  
[https://github.com/Sana-Shah-een/flicked_streaming_app](https://github.com/Sana-Shah-een/flicked_streaming_app)

---

## 🙌 About This Project

Developing Flicked has significantly enhanced my Flutter expertise, particularly in applying clean architecture and mastering Riverpod for state management. I look forward to continuing this journey by building more robust, scalable, and polished applications.

---

## 📄 License

This project is released under the [MIT License](LICENSE), allowing open-source use with minimal restrictions.  
