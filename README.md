# app_rickandmorty

2024 - Nikita - Big project Big problem

# Мобильное приложение Rick and Morty

## 🚀 Презентация рабочей функциональности:

<!-- https://github.com/yveskalume/gif-app/blob/main/preview/preview1.png -->


<p align="center">
    <img src="https://github.com/yveskalume/gif-app/blob/main/preview/preview1.png" width="32%"/>
    <img src="https://github.com/yveskalume/gif-app/blob/main/preview/preview1.png" width="32%"/>
    <img src="https://github.com/yveskalume/gif-app/blob/main/preview/preview1.png" width="32%"/>
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

- Версия Flutter: `2.x.x`
- Запуск тестов: `flutter test`
- Скрипты: 
    - [x] MobX
    - [x] RefreshList
    - [x] AppRunner
    - [x] theme
    - [x] textStyle
    - [ ] analyzer
    - [x] packages

#### Четкая и спланированная работа.
##### GitFlow
##### Planning process

### Demo App из UI-Kit теста

### Навигация - простая

### Git Flow
- Git Branch
- Git Work

## Структура приложения:

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
  - * Загрузка списка
  - * Ошибка списка
  - * Успешный список
- ! Debounce/Sequence... для нескольких обновлений списка
- Данные:
  - * Репозиторий - Логика = Logger, Benchmark
  - * DataSource - База данных и API

### InfoScreen
- ImageWidget:
  - * Загрузка списка
  - * Ошибка списка
  - * Успешный список
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
