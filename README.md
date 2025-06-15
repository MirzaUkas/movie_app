# MovieApp
Simple movie application for FitHub technical assessment

## Setup
### 1. Clone projects
### 2. Get access token in [TMDB Website](https://www.themoviedb.org/settings/api) after that put access token into `api_constants.dart`
### 3. Execute this command to get dependencies
```bash
flutter pub get
```
### 4. Execute this command to run & debug the application
```bash
flutter run --observatory-port=9200
```
### 5. If you’d like to try the app, you can simply download the APK from this [link](https://drive.google.com/file/d/1eZh_vz6Z0h0smXf_Lm2VAvxVx9hw7Fsh/view?usp=sharing).

## Project Structure
```
|-- lib
    |-- main.dart
    |-- core
        |-- base
            |-- base_usecase
            |-- base_api_request
        |-- constants
            |-- api_constants.dart
            |-- number_constants.dart
        |-- di
        |-- extensions
            |-- color_extension.dart
            |-- context_extension.dart
        |-- themes
        |-- utils
    |-- data
        |-- models
        |-- repositories
        |-- service
            |-- api_service.dart
        |-- source
            |-- local
              |-- movie_local_data_source.dart
            |-- remote
              |-- movie_api.dart
    |-- domain
        |-- entities
        |-- repositories
        |-- usecases
    |-- presentation
        |-- controllers
        |-- pages
          |-- home
            |-- widgets
            |-- home_page.dart    
```


