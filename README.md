# 🎬 Flicked - Flutter Movie Streaming App

[![Flutter](https://img.shields.io/badge/Flutter-v3.x-blue.svg?logo=flutter)](https://flutter.dev) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE) [![Riverpod](https://img.shields.io/badge/Riverpod-State_Management-green.svg)](https://riverpod.dev)

**Flicked** is a sleek, responsive Flutter-based movie streaming application delivering real-time content sourced from **The Movie Database (TMDb)**. With intuitive navigation and a clean, modern UI, users can effortlessly explore categories such as *Now Playing*, *Top Rated*, and *Upcoming*, alongside powerful advanced search functionality. Built on clean architecture principles and powered by **Riverpod**, Flicked ensures scalability, performance, and maintainability.

---

## 🚀 Features

- 🎥 Real-time movie content integration via the [TMDb API](https://www.themoviedb.org/documentation/api)  
- 🌐 Responsive UI optimized for a wide range of screen sizes and devices  
- 🔁 Infinite scrolling for smooth, dynamic content loading  
- 🔎 Advanced search with comprehensive filter-based results  
- 🎨 Dynamic blurred backgrounds that adapt to the currently selected movie poster  
- 🧩 Modular, maintainable codebase adhering to clean architecture best practices  
- ⚙️ Efficient, testable state management implemented with Riverpod  

---

## 🧱 Architecture Overview

Flicked follows a **clean architecture** approach that promotes separation of concerns and maintainability:

- **Presentation Layer:** Flutter widgets and UI components  
- **Application Layer:** State management powered by Riverpod  
- **Data Layer:** Handles API communication and response processing  
- **Domain Layer:** Defines core models and business logic  

This layered structure ensures scalability, testability, and ease of future enhancements.

---

## 🛠️ Tech Stack


| Technology                 | Role                                     |
|----------------------------|------------------------------------------|
| **Flutter**                | Cross-platform UI toolkit                 |
| **Dart**                   | Primary programming language              |
| **Riverpod**               | State management                          |
| **HTTP**                   | Networking and API requests               |
| **TMDb API**               | Movie content provider                    |
| **Material UI**            | Native mobile design system               |
| **VS Code / Android Studio** | Development environments               |

---
# Repository

Explore the full source code, report issues, or contribute here:  
[https://github.com/Sana-Shah-een/flicked_streaming_app](https://github.com/Sana-Shah-een/flicked_streaming_app)

---

## 🙌 About This Project

Developing Flicked has been an enriching experience that deepened my Flutter proficiency, especially in applying clean architecture and leveraging Riverpod for robust state management. I am excited to continue enhancing my skills and building scalable, maintainable, and polished mobile applications.

---


## 📄 License

This project is released under the [MIT License](LICENSE), enabling open-source use with minimal restrictions.

---


## How to Run

1. Make sure you have Flutter installed. If not, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).
   
2. Clone or download this project to your computer.
    ```bash
    git clone https://github.com/Sana-Shah-een/flicked_streaming_app.git

4. Open the project in your code editor (e.g., **Visual Studio Code**).

5. Run the following command in the terminal:
   ```bash
   flutter run

---
## 🔑 API Configuration
Your app requires API keys and base URLs to connect to TMDb services. Below are two common formats you might use:

### JSON Configuration Example

{<br>
  "API_KEY": "your_actual_api_key_here", <br>
  "BASE_API_URL": "https://api.themoviedb.org/3",<br>
  "BASE_IMAGE_API_URL": "https://image.tmdb.org/t/p/original/"<br>
}


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
