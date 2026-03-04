import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:brainova/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App launches and navigates to signup', (
    WidgetTester tester,
  ) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify Login Screen
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Log In'), findsOneWidget);

    // Tap Sign Up
    final signupButton = find.text('Sign Up');
    await tester.tap(signupButton);
    await tester.pumpAndSettle();

    // Verify Signup Screen
    expect(find.text('Create Account'), findsOneWidget);
  });
}
