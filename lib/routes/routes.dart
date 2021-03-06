
import 'package:auth_ui/screens/auth/login_screen.dart';
import 'package:auth_ui/screens/auth/otp/email_verification_screen.dart';
import 'package:auth_ui/screens/auth/register_screen.dart';
import 'package:auth_ui/screens/splash_screen.dart';

class Routes {
  static const String splashScreen = '/splashScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String emailVerificationScreen = '/emailVerificationScreen';

  static var list = {
    Routes.splashScreen: (context) => SplashScreen(),
    Routes.loginScreen: (context) => LoginScreen(),
    Routes.registerScreen: (context) => RegisterScreen(),
    Routes.emailVerificationScreen: (context) => EmailVerificationScreen(),
  };
}