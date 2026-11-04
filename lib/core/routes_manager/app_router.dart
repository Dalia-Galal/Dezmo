import 'package:e_commerceapp/core/di/service_locator.dart';
import 'package:e_commerceapp/core/routes_manager/page_route_name.dart';
import 'package:e_commerceapp/core/storage/token_storage.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/forget_password/forget_password_bloc.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/sign_in/sign_in_bloc.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:e_commerceapp/modules/auth/presentation/pages/forget_password.dart';
import 'package:e_commerceapp/modules/auth/presentation/pages/login_screen.dart';
import 'package:e_commerceapp/modules/auth/presentation/pages/signup_screen.dart';
import 'package:e_commerceapp/modules/home/home_screen.dart';
import 'package:e_commerceapp/modules/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: PageRouteName.splash,
    redirect: (context, state) async {
      final isLoggedIn = await getIt<TokenStorage>().isAuthenticated();
      final isGoingToAuth =
          state.matchedLocation == PageRouteName.splash ||
          state.matchedLocation == PageRouteName.login ||
          state.matchedLocation == PageRouteName.signUp ||
          state.matchedLocation == PageRouteName.forgotPassword ||
          state.matchedLocation == PageRouteName.home;

      if (!isLoggedIn && !isGoingToAuth) {
        return PageRouteName.login;
      }

      if (isLoggedIn && isGoingToAuth) {
        return PageRouteName.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: PageRouteName.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: PageRouteName.login,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<SignInBloc>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: PageRouteName.signUp,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<SignUpBloc>(),
          child: const SignupScreen(),
        ),
      ),
      GoRoute(
        path: PageRouteName.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: PageRouteName.forgotPassword,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<ForgetPasswordBloc>(),
          child: const ForgetPassword(),
        ),
      ),
    ],
  );
}
