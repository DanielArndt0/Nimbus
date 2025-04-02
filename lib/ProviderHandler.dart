import 'package:nimbus/App/App.dart';
import 'package:nimbus/Controllers/AuthCodeScreenController.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Controllers/OnboardingScreenController.dart';
import 'package:nimbus/Controllers/LoginScreenController.dart';
import 'package:nimbus/Controllers/SignUpScreenController.dart';
import 'package:nimbus/Controllers/impl/AuthCodeScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/HomeScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/NavigationControllerImpl.dart';
import 'package:nimbus/Controllers/impl/OnboardingScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/LoginScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/SignUpScreenControllerImpl.dart';
import 'package:nimbus/Providers/FbAuthProvider.dart';
import 'package:nimbus/Providers/impl/FbAuthProviderImpl.dart';
import 'package:nimbus/Services/AuthService.dart';
import 'package:nimbus/Services/LogService.dart';
import 'package:nimbus/Services/NavigationService.dart';
import 'package:nimbus/Services/StorageService.dart';
import 'package:nimbus/Services/impl/AuthServiceImpl.dart';
import 'package:nimbus/Services/impl/LogServiceImpl.dart';
import 'package:nimbus/Services/impl/NavigationServiceImpl.dart';
import 'package:nimbus/Services/impl/StorageServiceImpl.dart';
import 'package:provider/provider.dart';

final MultiProvider providerHandler = MultiProvider(
  providers: [
    Provider<LogService>(create: (context) => LogServiceImpl.instance),
    Provider<NavigationService>(
      create: (context) => NavigationServiceImpl.instance,
    ),
    Provider<StorageService>(create: (context) => StorageServiceImpl.instance),
    ChangeNotifierProvider<FbAuthProvider>(
      create: (context) => FbAuthProviderImpl(),
    ),
    ProxyProvider<FbAuthProvider, AuthService>(
      update:
          (context, authProvider, previous) =>
              AuthServiceImpl(authProvider: authProvider),
    ),
    ProxyProvider<NavigationService, NavigationController>(
      update:
          (context, navigationService, previous) =>
              NavigationControllerImpl(navigationService: navigationService),
    ),
    ProxyProvider<NavigationController, OnboardingScreenController>(
      update:
          (context, navigationController, previous) =>
              OnboardingScreenControllerImpl(
                navigationController: navigationController,
              ),
    ),
    ProxyProvider3<
      LogService,
      AuthService,
      NavigationController,
      LoginScreenController
    >(
      update:
          (context, logService, authService, navigationContoller, previous) =>
              LoginScreenControllerImpl(
                logService: logService,
                authService: authService,
                navigationController: navigationContoller,
              ),
    ),
    ProxyProvider3<
      LogService,
      AuthService,
      NavigationController,
      SignUpScreenController
    >(
      update:
          (context, logService, authService, navigationContoller, previous) =>
              SignUpScreenControllerImpl(
                logService: logService,
                authService: authService,
                navigationController: navigationContoller,
              ),
    ),
    ProxyProvider3<
      LogService,
      AuthService,
      NavigationController,
      AuthCodeScreenController
    >(
      update:
          (context, logService, authService, navigationContoller, previous) =>
              AuthCodeScreenControllerImpl(
                logService: logService,
                authService: authService,
                navigationController: navigationContoller,
              ),
    ),
    ProxyProvider4<
      StorageService,
      LogService,
      AuthService,
      NavigationController,
      HomeScreenController
    >(
      update:
          (
            context,
            storageService,
            logService,
            authService,
            navigationContoller,
            previous,
          ) => HomeScreenControllerImpl(
            storageService: storageService,
            logService: logService,
            authService: authService,
            navigationController: navigationContoller,
          ),
    ),
  ],
  child: const MyApp(),
);
