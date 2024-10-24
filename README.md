# app_rickandmorty

2024 - Nikita - Big project Big problem

# Мобильное приложение Rick and Morty

## 🚀 Презентация рабочей функциональности:

<!-- https://github.com/yveskalume/gif-app/blob/main/preview/preview1.png -->


<p align="center">
    <img src="https://github.com/Taverz/app_rickandmorty/blob/main/presentation/characters_loader_image_list.png" width="32%"/>
    <img src="https://github.com/Taverz/app_rickandmorty/blob/main/presentation/characters_shimmer.png" width="32%"/>
    <img src="https://github.com/Taverz/app_rickandmorty/blob/main/presentation/character_success_load_list.png" width="32%"/>
</p> 

## ⭐️ Функционал:

- SplashScreen: загрузка данных из локального хранилища
- ListScreen: отображение списка с возможностью обновления
- InfoScreen: подробная информация о выбранном элементе

## 🎨 Техническое задание:

Требования к реализации
● Проект должен быть загружен на github.
● В качестве state management нужно использовать MobX.
● Можно использовать любые пакеты c pub.dev.
● Всё остальное на ваше усмотрение.

Требования к функционалу.
Экран Characters
Url: https://rickandmortyapi.com/api/character
Нужно отобразить персонажей сеткой. Каждого персонажа
можно лайкнуть. Информация о лайках сохраняется при выходе/входе в
приложение.
Экран Details
Url: https://rickandmortyapi.com/api/character/{characterId}
Отображаем детали по персонажу. Иконка для имени всегда одна и та
же. Иконки для других полей меняются в соответствии со значением.

Критерии приёмки
В первую очередь будет оцениваться общая структура проекта,
чистота кода, архитектура. Постарайтесь, пожалуйста, написать
проект так, как вы бы делали на работе, если бы это был большой
полноценный проект. Покажите все свои скилы. Если где-то хотите

## 🌊 План работы:

1. Настройка архитектуры приложения
2. Реализация функционала экранов
3. Тестирование и отладка
4. Разработка документации
5. Подготовка к релизу

## ⚡️ Цели и задачи:

- Создание интуитивно понятного интерфейса
- Обеспечение стабильной работы приложения
- Реализация эффективного взаимодействия с API
- Написание юнит-тестов и настройка CI/CD

## 🔥 Описание и запуск проекта / документация:

- Версия Flutter: `3.2.2`
- Запуск тестов: `flutter test`

#### Четкая и спланированная работа.
##### GitFlow
##### Planning process

### Demo App из UI-Kit теста

### Навигация - простая

### Git Flow
- Git Branch
- Git Work

## Структура приложения:

- Что есть в проекте: 
    - [x] MobX
    - [x] RefreshList
    - [x] AppRunner
    - [x] theme
    - [x] textStyle
    - [ ] analyzer
    - [x] packages
 

```plaintext
lib                      
├── src                  # Правила доступа
│   ├── common           # Общие функции и утилиты
│   │   └── dependence
│   │       ├── global_data.dart    # Глобальные данные
│   │       └── service_locator.dart # Служба для управления зависимостями
│   │   └── router      # Настройка маршрутизации
│   │       ├── app_router.dart       # Основной маршрутизатор
│   │       └── screen_launch_app.dart # Экран запуска приложения
│   ├── feature          # Основные функции приложения
│   │   ├── character_info
│   │   │   ├── character_info.dart # Информация о персонаже
│   │   │   └── characters_list
│   │   │       └── data_characters_list.dart # Данные списка персонажей
│   │   ├── state_manager
│   │   │   ├── character_model_mobx.dart # Модель для MobX
│   │   │   ├── character_model_mobx.g.dart # Сгенерированный код для MobX
│   │   │   └── characters_store.g.dart # Хранилище персонажей
│   │   └── widgets      # Повторно используемые виджеты
│   │       ├── characters_list.dart  # Виджет списка персонажей
│   │       └── characters_list_page.dart # Страница со списком персонажей
│   └── launch_app       # Запуск приложения
│       ├── launch_app.dart      # Основной файл для запуска приложения
│       ├── app_init.dart          # Инициализация приложения
│       ├── main_demo.dart         # Демонстрация функционала
│       └── main.dart              # Основная точка входа в приложение
│
│
│
│
│
packages                     # Папка с дополнительными пакетами
│
├── ui_kit_app               # UI Widget from this project
│   └── lib                  
│   │    └── src              # Правила доступа
│   │    │    ├── common       # Общие компоненты и утилиты
│   │    │    ├── demo     # Примеры и демонстрации функционала
│   │    │    ├── feature   # Функционал
│   │    │    │   ├── characters              # Компоненты для персонажей
│   │    │    │   │   ├── character_card.dart  # Карта персонажа
│   │    │    │   │   ├── character_image.dart  # Изображение персонажа
│   │    │    │   │   ├── characters_list.dart  # Список персонажей
│   │    │    │   │   └── like_button.dart      # Кнопка "Нравится"
│   │    │    │   ├── details                   # Дополнительные детали
│   │    │    │   │   └── feature.dart          # Функционал деталей
│   │    │    │   ├── generated                 # Сгенерированные файлы (например, коды)
│   │    │    │   ├── theme                     # Темы и стили приложения
│   │    │    │   └── utils                     # Утилиты и вспомогательные функции
│   │    └── ui_kit_app.dart      # Правила доступа - Основной файл утилит
│   └── test               # Тестовые файлы
│         └── ├── .gitignore    # Файл для игнорирования Git
│             ├── .metadata      # Метаданные проекта
│             ├── analysis_options.yaml # Опции анализа
│             ├── LICENSE        # Лицензия проекта
│             ├── pubspec.yaml   # Файл конфигурации пакета
│             └── .gitkeep       # Папка, которая должна сохраняться в репозитории
│
├── client_rickandmorty       # Пакет клиента для API Рика и Морти
│   └── lib                    
│       └── src                # Правила доступа
│           ├── utils          # Утилиты для работы с API
│           │   ├── api_rick_and_morty_interface.dart  # Интерфейс API
│           │   ├── api_rick_and_morty.dart            # Реализация API
│           │   ├── main_core_client.dart               # Основной клиент
│           │   └── client_rickandmorty.dart            # Клиент Рика и Морти
│           └── test           # Тесты для пакета
│               ├── .gitignore
│               ├── .metadata
│               ├── analysis_options.yaml
│               ├── LICENSE
│               └── pubspec.yaml
│
├──models_app               # Пакет для моделей данных
│    └── lib                 
│        ├── src              # Правила доступа
│        │   ├── exception     # Обработка исключений
│        │   ├── models        # Определение моделей
│        │   └── models_app.dart # Основной файл для моделей
│        └── test              # Тесты для моделей
│            ├── .gitignore
│            ├── .metadata
│            ├── analysis_options.yaml
│            ├── LICENSE
│            └── pubspec.yaml
├── core_app                  # Папка с логикой для взаимодействия с другими пакетами
│    └── lib                   
│        ├── src               # Правила доступа
│        │   ├── character     # Функции, связанные с персонажами
│        │   │   ├── data
│        │   │   │   └── character_datasource.dart # Источник данных персонажей
│        │   │   ├── domain
│        │   │   │   ├── character_datasource_interface.dart # Интерфейс источника данных
│        │   │   │   └── character_repository_interface.dart  # Интерфейс репозитория персонажей
│        │   │   └── repository
│        │   │       ├── character_repository.dart # Реализация репозитория персонажей
│        │   ├── common  # Общие функции
│        │   │   ├── crud_character_interface.dart # Интерфейс для CRUD операций
│        │   │   └── database_helper.dart        # Утилиты для работы с базой данных
│        │   └── env_app # Переменные окружения
│        │       ├── main_core_app.dart # Основной файл приложения
│        │       └── core_app.dart     # Файл конфигурации
│        └── test       # Тесты для приложения
│            ├── .gitignore
│            ├── .metadata
│            ├── analysis_options.yaml
│            ├── LICENSE
│            └── pubspec.yaml

```
<!-- 
# Структура проекта

## ui_kit_app
- **lib**
  - **src**
    - **common**
    - **feature**
    - **launch_app**
- **packages**
  - **client_rickandmorty**
  - **models_app**
- **test** -->

### SplashScreen
- Загрузка данных из локального хранилища

### ListScreen
- RefreshList
- ListView
- StateAlive / Key 
- ListWidget:
  - * Загрузка списка
  - * Ошибка списка - обновление списка
  - * Успешный список
- ElementListWidget:
  - * Загрузка
  - * Ошибка
  - * Успешно
- ! Debounce/Sequence... для нескольких обновлений списка
- Данные:
  - * Репозиторий - Логика = Logger, Benchmark
  - * DataSource - База данных и API

### InfoScreen
- ImageWidget:
  - * Загрузка
  - * Ошибка
  - * Успешно
- DescriptionWidget:
  - * Загрузка списка
  - * Ошибка списка
  - * Успешный список
- Данные:
  - * Репозиторий - Логика = Logger, Benchmark
  - * DataSource - База данных и API

#### База данных - CRUD

#### Проверка отсутствия интернет-соединения

#### Фейковый / Мок API

#### Unit-тесты

#### CI/CD - Github Action

#### APK в релизе на Github

#### Адаптивный интерфейс

#### Скриншоты в Devtools - профилирование
