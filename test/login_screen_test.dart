import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_test/login_screen.dart';

void main() {

  Widget buildLoginScreen() {
    return const MaterialApp(
      home: LoginScreen()
    );
  }

  testWidgets('Find Username TextField with label of Username', (WidgetTester tester) async {
    await tester.pumpWidget( buildLoginScreen());
    // find username field
    final findUsernameTextFormField = find.byWidgetPredicate((widget) {
      return widget is TextField
          && !widget.obscureText
          && widget.decoration?.labelText == 'Username';
    });
    expect(findUsernameTextFormField, findsOneWidget);
  });

  testWidgets("Find Password TextField with label of Password", (WidgetTester tester) async {
    await tester.pumpWidget( buildLoginScreen());
    // find password field
    final findPasswordTextFormField = find.byWidgetPredicate((widget) {
      return widget is TextField
          && widget.obscureText
          && widget.decoration?.labelText == 'Password';
    });
    expect(findPasswordTextFormField, findsOneWidget);
  });

  testWidgets("Find Login Button with label of Login", (WidgetTester tester) async {
    await tester.pumpWidget( buildLoginScreen());
    // find login button
    final findLoginButton = find.widgetWithText(
        ElevatedButton,
        "Login"
    );
    expect(findLoginButton, findsOneWidget);
  });

  testWidgets("Find Password Visibility Icon", (tester) async {
    await tester.pumpWidget( buildLoginScreen());

    final findPasswordVisibilityIcon = find.byIcon(Icons.visibility_off);
    expect(findPasswordVisibilityIcon, findsOneWidget);
  },);

  testWidgets("Toggle Password Visibility", (WidgetTester tester) async {
    await tester.pumpWidget( buildLoginScreen());
    final findPasswordVisibilityIcon = find.byIcon(Icons.visibility_off);
    // tab on password visibility icon and it change to password not visible
    await tester.tap(findPasswordVisibilityIcon);
    await tester.pump();
    final findPasswordNotVisibleIcon = find.byIcon(Icons.visibility);
    expect(findPasswordNotVisibleIcon, findsOneWidget);

    final findPasswordTextFormField = find.byWidgetPredicate((widget) {
      return widget is TextField
          && !widget.obscureText
          && widget.decoration?.labelText == 'Password';
    });
    expect(findPasswordTextFormField, findsOneWidget);
  });

  testWidgets("Tab Login Button and show alert dialog with loading", (WidgetTester tester) async {
    await tester.pumpWidget( buildLoginScreen());

    final findLoginButton = find.widgetWithText(
        ElevatedButton,
        "Login"
    );
    await tester.tap(findLoginButton);
    await tester.pump();

    final findAlertDialog = find.byType(AlertDialog);
    expect(findAlertDialog, findsOneWidget);
  },);
}
