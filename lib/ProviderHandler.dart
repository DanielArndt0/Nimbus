import 'package:nimbus/App/App.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Controllers/OnboardingScreenController.dart';
import 'package:nimbus/Controllers/SignInModalController.dart';
import 'package:nimbus/Controllers/impl/NavigationControllerImpl.dart';
import 'package:nimbus/Controllers/impl/OnboardingScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/SignInModalControllerImpl.dart';
import 'package:nimbus/Providers/FbAuthProvider.dart';
import 'package:nimbus/Providers/impl/FbAuthProviderImpl.dart';
import 'package:nimbus/Services/AuthService.dart';
import 'package:nimbus/Services/LogService.dart';
import 'package:nimbus/Services/NavigationService.dart';
import 'package:nimbus/Services/impl/AuthServiceImpl.dart';
import 'package:nimbus/Services/impl/LogServiceImpl.dart';
import 'package:nimbus/Services/impl/NavigationServiceImpl.dart';
import 'package:provider/provider.dart';

final MultiProvider providerHandler = MultiProvider(
  providers: [
    Provider<LogService>(create: (context) => LogServiceImpl.instance),
    ChangeNotifierProvider<FbAuthProvider>(
      create: (context) => FbAuthProviderImpl(),
    ),
    ProxyProvider<FbAuthProvider, AuthService>(
      update:
          (context, authProvider, previous) =>
              AuthServiceImpl(authProvider: authProvider),
    ),
    Provider<NavigationService>(
      create: (context) => NavigationServiceImpl.instance,
    ),
    ProxyProvider<NavigationService, NavigationController>(
      update:
          (context, navigationService, previous) =>
              NavigationControllerImpl(navigationService: navigationService),
    ),
    ProxyProvider3<
      LogService,
      AuthService,
      NavigationController,
      SignInModalController
    >(
      update:
          (context, logService, authService, navigationContoller, previous) =>
              SignInModalControllerImpl(
                logService: logService,
                authService: authService,
                navigationController: navigationContoller,
              ),
    ),

    ProxyProvider<NavigationController, OnboardingScreenController>(
      update:
          (context, navigationController, previous) =>
              OnboardingScreenControllerImpl(
                navigationController: navigationController,
              ),
    ),
  ],
  child: const MyApp(),
);
