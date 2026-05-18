import 'package:e_commerceapp/core/routes_manager/page_route_name.dart';
import 'package:e_commerceapp/modules/auth/presentation/pages/forget_passwrd.dart';
import 'package:e_commerceapp/modules/auth/presentation/pages/login_screen.dart';
import 'package:e_commerceapp/modules/auth/presentation/pages/signUp_screen.dart';
import 'package:e_commerceapp/modules/home/home_screen.dart';
import 'package:e_commerceapp/modules/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static bool _isLoggedIn = false;
  static final GoRouter router = GoRouter(
    initialLocation: PageRouteName.splash,
    redirect: (context, state) {
      final isGoingToAuth =
          state.matchedLocation == PageRouteName.splash ||
          state.matchedLocation == PageRouteName.login ||
          state.matchedLocation == PageRouteName.signUp;

      if (!_isLoggedIn && !isGoingToAuth) {
        return PageRouteName.login;
      }
      if(_isLoggedIn && isGoingToAuth){
        return PageRouteName.home;
      }
      return null;
    },
    routes: [
      GoRoute(path: PageRouteName.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: PageRouteName.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(path: PageRouteName.signUp,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(path: PageRouteName.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(path: PageRouteName.forgotPassword,
        builder: (context, state) => const ForgetPasswrd(),
      ),
    ],
  );
}
