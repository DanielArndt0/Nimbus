import 'package:nimbus/App/App.dart';
import 'package:nimbus/Controllers/AuthCodeScreenController.dart';
import 'package:nimbus/Controllers/AuthController.dart';
import 'package:nimbus/Controllers/FolderController.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Controllers/LoginWithPhoneScreenController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Controllers/OTPScreenController.dart';
import 'package:nimbus/Controllers/OnboardingScreenController.dart';
import 'package:nimbus/Controllers/LoginScreenController.dart';
import 'package:nimbus/Controllers/SignUpScreenController.dart';
import 'package:nimbus/Controllers/impl/AuthCodeScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/AuthControllerImpl.dart';
import 'package:nimbus/Controllers/impl/FolderControllerImpl.dart';
import 'package:nimbus/Controllers/impl/HomeScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/LoginWithPhoneScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/NavigationControllerImpl.dart';
import 'package:nimbus/Controllers/impl/OTPScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/OnboardingScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/LoginScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/SignUpScreenControllerImpl.dart';
import 'package:nimbus/Providers/FbAuthProvider.dart';
import 'package:nimbus/Providers/impl/FbAuthProviderImpl.dart';
import 'package:nimbus/Services/AuthService.dart';
import 'package:nimbus/Services/DatabaseService.dart';
import 'package:nimbus/Services/LogService.dart';
import 'package:nimbus/Services/NavigationService.dart';
import 'package:nimbus/Services/impl/AuthServiceImpl.dart';
import 'package:nimbus/Services/impl/DatabaseServiceImpl.dart';
import 'package:nimbus/Services/impl/LogServiceImpl.dart';
import 'package:nimbus/Services/impl/NavigationServiceImpl.dart';
import 'package:provider/provider.dart';

final MultiProvider providerHandler = MultiProvider(
  providers: [
    Provider<LogService>(create: (context) => LogServiceImpl.instance),

    Provider<NavigationService>(
      create: (context) => NavigationServiceImpl.instance,
    ),
    ChangeNotifierProvider<FbAuthProvider>(
      create: (context) => FbAuthProviderImpl(),
    ),
    Provider<DatabaseService>(
      create: (context) => DatabaseServiceImpl.instance,
    ),
    ProxyProvider<FbAuthProvider, AuthService>(
      update:
          (context, authProvider, previous) =>
              AuthServiceImpl(authProvider: authProvider),
    ),
    ProxyProvider2<AuthService, DatabaseService, AuthController>(
      update:
          (context, authService, databaseService, previous) =>
              AuthControllerImpl(
                authService: authService,
                databaseService: databaseService,
              ),
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
      DatabaseService,
      AuthController,
      NavigationController,
      FolderController
    >(
      update:
          (
            context,
            databaseService,
            authController,
            navigationContoller,
            previous,
          ) => FolderControllerImpl(
            databaseService: databaseService,
            authController: authController,
            navigationController: navigationContoller,
          ),
    ),
    ProxyProvider3<
      LogService,
      AuthController,
      NavigationController,
      LoginScreenController
    >(
      update:
          (
            context,
            logService,
            authController,
            navigationContoller,
            previous,
          ) => LoginScreenControllerImpl(
            logService: logService,
            authController: authController,
            navigationController: navigationContoller,
          ),
    ),
    ProxyProvider3<
      LogService,
      AuthController,
      NavigationController,
      SignUpScreenController
    >(
      update:
          (
            context,
            logService,
            authController,
            navigationContoller,
            previous,
          ) => SignUpScreenControllerImpl(
            logService: logService,
            authController: authController,
            navigationController: navigationContoller,
          ),
    ),
    ProxyProvider3<
      LogService,
      AuthController,
      NavigationController,
      OTPScreenController
    >(
      update:
          (
            context,
            logService,
            authController,
            navigationContoller,
            previous,
          ) => OTPScreenControllerImpl(
            logService: logService,
            authController: authController,
            navigationController: navigationContoller,
          ),
    ),
    ProxyProvider3<
      LogService,
      AuthController,
      NavigationController,
      AuthCodeScreenController
    >(
      update:
          (
            context,
            logService,
            authController,
            navigationContoller,
            previous,
          ) => AuthCodeScreenControllerImpl(
            logService: logService,
            authController: authController,
            navigationController: navigationContoller,
          ),
    ),
    ProxyProvider3<
      LogService,
      AuthController,
      NavigationController,
      LoginWithPhoneScreenController
    >(
      update:
          (
            context,
            logService,
            authController,
            navigationContoller,
            previous,
          ) => LoginWithPhoneScreenControllerImpl(
            logService: logService,
            authController: authController,
            navigationController: navigationContoller,
          ),
    ),

    ProxyProvider3<
      LogService,
      AuthController,
      NavigationController,
      HomeScreenController
    >(
      update:
          (
            context,
            logService,
            authController,
            navigationContoller,
            previous,
          ) => HomeScreenControllerImpl(
            logService: logService,
            authController: authController,
            navigationController: navigationContoller,
          ),
    ),
  ],
  child: const MyApp(),
);
