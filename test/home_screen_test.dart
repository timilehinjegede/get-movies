import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/route_manager.dart';
import 'package:get_movies/core/controllers/movie_controller.dart';
import 'package:get_movies/main.dart';
import 'package:get_movies/ui/screens/home_screen.dart';

void main() {
  // ignore: unused_local_variable
  late MovieController _movieController;

  setUp(() {
    _movieController = MovieController();
  });
  group('Home Screen Widgets Test', () {
    testWidgets(
      'A text can be entered into the textfield',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          GetMaterialApp(
            home: HomeScreen(),
          ),
        );
        var textField = find.byType(TextField);
        expect(textField, findsOneWidget);

        var query = 'The Avengers';
        await tester.enterText(textField, query);
        expect(find.text(query), findsOneWidget);
      },
    );

    testWidgets(
      'Tapping the Go button should return list of movies',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          GetMaterialApp(
            home: HomeScreen(),
          ),
        );

        await tester.pumpWidget(MyApp());
        var textButton = find.byType(TextButton);
        expect(textButton, findsOneWidget);

        await tester.tap(textButton);
      },
    );
    testWidgets(
      'Tapping the Go button should show a dialog if there is an error',
      (WidgetTester tester) async {},
    );

    testWidgets(
      'A list of popular movies should be displayed',
      (WidgetTester tester) async {},
    );
    testWidgets(
      'A list of upcoming movies should be displayed',
      (WidgetTester tester) async {},
    );
    testWidgets(
      'A list of top rated movies should be displayed',
      (WidgetTester tester) async {},
    );
    testWidgets(
      'An error UI should be displayed if an error was encountered while fetching upcoming movies',
      (WidgetTester tester) async {},
    );
    testWidgets(
      'An error UI should be displayed if an error was encountered while fetching popular movies',
      (WidgetTester tester) async {},
    );
    testWidgets(
      'An error UI should be displayed if an error was encountered while fetching top rated movies',
      (WidgetTester tester) async {},
    );
  });
}

/*
TEST CASES
1. I want to be able to to find a textfield
2. I want to be able to enter a text into the textfield
3. I want to be able to see one button
4. I want to be able to tap on a button
5. After tapping on a button, mock the data
6. match the datat
7. After tapping on a button, mock an error
8. math the error
*/
