# Orbit

**Slogan:** *Your life, Your rhythm.*

Orbit is a mobile productivity app (built with Flutter) designed to help users track habits, manage routines, and maintain a healthy lifestyle—all personalized to fit your rhythm.

---

## Overview

Orbit is your personal assistant for building better habits and keeping track of your health and daily productivity. With a playful, approachable interface and engaging characters, Orbit makes forming healthy routines fun and motivating.

---

## Purpose

Orbit helps users:
- Build and track daily habits.
- Monitor health stats like water intake and sleep progress.
- Maintain personalized routines.
- Enhance productivity in a playful and stress-free way.

---

## Core Features (MVP & Planned)

- **Onboarding:** Intuitive setup for language, themes (light/dark), permissions, and personal account.
- **Health Dashboard:** Visualizes key metrics like water intake, sleep hours, and other health stats.
- **Habit Tracking:** Set habits, track streaks, mark completion, and celebrate milestones.
- **Notifications & Reminders:** Gentle nudges for water, exercise, or other tracked routines.
- **Personalization:** Supports themes, language preferences, and custom schedules.
- **Playful UI:** Characters (sun-headed boy & moon-headed girl) guide users, inspired by apps like Duolingo. Colorful, engaging illustrations and animations.

---

## Expanded Architecture

Orbit is designed for scalability, maintainability, and testability, bringing together modern Flutter practices:

### Layered Architecture

- **Feature Modules:**  
  Each key feature (e.g., Onboarding, Habit Tracking, Health Dashboard) is encapsulated in its own directory within `lib/features/`, containing widgets, Blocs, and models.
- **Core Layer (`lib/core/`):**  
  Shared components such as common widgets, constants, error handling, service interfaces (e.g., notification, localization), and custom utilities.
- **Data Layer:**  
  Responsible for persistence and retrieval, including:
  - **SQL Database:** Orbit leverages [sqflite](https://pub.dev/packages/sqflite) for efficient local SQLite storage.  
    - All persistent user data (habits, health records, preferences) is managed through a well-defined repository/data provider pattern.  
    - DAOs (Data Access Objects) abstract database operations for maintainable and testable data logic.
  - **Models:**  
    Domain models are defined in `lib/models/` and used for mapping between database entities and UI logic.
- **Business Logic Layer:**
  - **Bloc/Cubit:**  
    Every feature has its own Bloc or Cubit for business rules, handling state transitions and reacting to user interactions.  
    Bloc patterns keep logic out of widgets and make testing easier.
  - **Repositories:**  
    Connect Blocs to the data layer, exposing async APIs for features (e.g., CRUD for habits, querying health stats).
- **Presentation Layer:**
  - **Widgets & Screens:**  
    Implemented with clear separation of concerns. UI is reactive to Bloc/Cubit state.
  - **Themes & Localization:**  
    Implements dynamic theme switching (light/dark) and multilingual support using Flutter's localization APIs.

### Navigation

- **GoRouter** is used for flexible, declarative navigation between modules, supporting deep linking and route-based state restoration.

### Notifications

- Implemented using [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) to send reminders and alerts based on user schedules and tracked habits.

### Testing

- **Unit Tests:** For data and business logic in repositories and Blocs.
- **Widget Tests:** Cover interactive and visual widgets.
- Test files are organized in the `/test` directory.

### Design & Prototyping

- The UI and user flow are designed with [Figma](https://figma.com/design/tznG65DqMqJSmlzYPS8onV/Orbit-%7C-Habit-Tracker?node-id=14-4&t=1SBQdimuRGsy8BBn-1).  
  Animated illustrations and playful themes are central to Orbit's experience.

---

## State Management: Bloc

- **Why Bloc?**
  - Ensures predictable and testable state handling.
  - Facilitates the separation of UI and business logic, making features more maintainable and scalable.
- **Implementation:**
  - Feature-specific Blocs/Cubits manage all logic, emitting states consumed by UI widgets.
  - Asynchronous operations (e.g., fetching habits from SQLite) are cleanly handled in Blocs using Repositories.

---

## Local Database: sqflite

- Orbit uses sqflite to persist:
  - User habits & streaks
  - Health tracking stats (e.g., water intake, sleep)
  - App settings and personalization
- Database operations are abstracted via DAOs and repositories, assuring reliable migrations and minimizing data loss.
- Offline-friendly: all user data is stored locally, keeping the app fast and private.

---

## Design Philosophy

- Playful, engaging, and inclusive—Orbit invites users to enjoy their daily routines.
- Visual storytelling and interactive elements make habit building fun (characters, animations, badges).
- Inspired by apps such as Duolingo for motivation and gamification.

---

## MVP Progress

⚠️ **This project is currently in development and the initial version (MVP) is not yet complete.**  
Features, UI, and documentation will evolve regularly. Contributions and feedback are welcome!
