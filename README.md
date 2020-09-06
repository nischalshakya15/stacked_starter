# stacked_starter

CRUD operation in flutter using [Stacked Architecture](https://pub.dev/packages/stacked). 
This project follows the MVVM pattern and implements the following things.
* Dio Interceptor
* Build flavor

# Setup 
* git clone https://github.com/nischalshakya15/stacked_starter.git
* Import the project in android studio or vscode
* Setup the entry point i.e. main_dev.dart or main_prod.dart
* Run **flutter pub build_runner build ----delete-conflicting-outputs** 
* Run on the andorid device or emulator 


# Swagger Documentation 
* [Authentication](https://spring-authentication-module.herokuapp.com/swagger-ui.html)
* [Authorization](https://spring-authorization-module.herokuapp.com/swagger-ui.html)

# Build 
* For production **flutter build apk -t lib/main_dev.dart**
* For development **flutter build apk -t lib/main_prod.dart**


# Issues 

|Issue     | Link       |
|:---------| :----------|
| Missing *.g.dart file while defining model class as JsonSerializable | [Github](https://github.com/dart-lang/build/issues/1990) |
| Jwt Authentication with flutter | [Github](https://github.com/carzacc/jwt-tutorial-flutter/blob/master/lib/main.dart) <br> [Carmine](https://carmine.dev/posts/flutterwebjwt/) |
| Interceptors in Dio package | [Medium](https://medium.com/flutter-community/dio-interceptors-in-flutter-17be4214f363) |
| FutureBuilder on widget | [Medium](https://medium.com/nonstopio/flutter-future-builder-with-list-view-builder-d7212314e8c9) |
| Guide to the ListTile | [Medium](https://medium.com/@suragch/a-complete-guide-to-flutters-listtile-597a20a3d449) |
| Flutter form with validation | [CodingWithJoe](https://codingwithjoe.com/building-forms-with-flutter/) <br> [Medium](https://medium.com/@mahmudahsan/how-to-create-validate-and-save-form-in-flutter-e80b4d2a70a4) |
| Run button disable in android studio | [Stackoverflow](https://stackoverflow.com/questions/28385172/run-button-is-disabled-in-android-studio#:~:text=If%20you%20have%20changed%20jdk,in%20editbar%20in%20right%20bar.&text=If%20your%20IDE%20is%20in,make%20sure%20it%20is%20disabled.)|
| Making sense of Providers | [Medium](https://medium.com/flutter-community/making-sense-all-of-those-flutter-providers-e842e18f45dd) <br> [Codetober](https://codetober.com/flutter-provider-examples/)|
| Flavors or Build Variant in flutter | [Medium](https://medium.com/meeve/build-variants-in-flutter-for-multiple-backend-environments-7e139128949b) <br> [Medium](https://medium.com/@artem.diashkin/flutter-using-environment-variables-24a976ae1335) <br> [Github](https://github.com/daniellampl/flutter_env)|
| AsyncMemonizer | [Medium](https://medium.com/saugo360/flutter-my-futurebuilder-keeps-firing-6e774830bc2)|
| Flutter architecture provider implementation guide | [Filledstacks](https://www.filledstacks.com/post/flutter-architecture-my-provider-implementation-guide/) |
| Stacked architecture | [Pub.Dev](https://pub.dev/packages/stacked) |


