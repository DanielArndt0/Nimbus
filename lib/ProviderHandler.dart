import 'package:nimbus/App/App.dart';
import 'package:nimbus/Controllers/AuthCodeScreenController.dart';
import 'package:nimbus/Controllers/AuthController.dart';
import 'package:nimbus/Controllers/FileController.dart';
import 'package:nimbus/Controllers/HomeScreenController.dart';
import 'package:nimbus/Controllers/LoginWithPhoneScreenController.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Controllers/OTPScreenController.dart';
import 'package:nimbus/Controllers/OnboardingScreenController.dart';
import 'package:nimbus/Controllers/LoginScreenController.dart';
import 'package:nimbus/Controllers/SignUpScreenController.dart';
import 'package:nimbus/Controllers/impl/AuthCodeScreenControllerImpl.dart';
import 'package:nimbus/Controllers/impl/AuthControllerImpl.dart';
import 'package:nimbus/Controllers/impl/FileControllerImpl.dart';
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
import 'package:nimbus/Services/StorageService.dart';
import 'package:nimbus/Services/impl/AuthServiceImpl.dart';
import 'package:nimbus/Services/impl/DatabaseServiceImpl.dart';
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
    ChangeNotifierProvider<FbAuthProvider>(
      create: (context) => FbAuthProviderImpl(),
    ),
    Provider<DatabaseService>(
      create: (context) => DatabaseServiceImpl.instance,
    ),
    Provider<StorageService>(create: (context) => StorageServiceImpl.instance),
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
    ProxyProvider3<
      AuthController,
      DatabaseService,
      StorageService,
      FileController
    >(
      update:
          (
            context,
            authController,
            databaseService,
            storageService,
            previous,
          ) => FileControllerImpl(
            authController: authController,
            databaseService: databaseService,
            storageService: storageService,
          ),
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
    ProxyProvider4<
      FileController,
      LogService,
      AuthController,
      NavigationController,
      HomeScreenController
    >(
      update:
          (
            context,
            fileController,
            logService,
            authController,
            navigationContoller,
            previous,
          ) => HomeScreenControllerImpl(
            fileController: fileController,
            logService: logService,
            authController: authController,
            navigationController: navigationContoller,
          ),
    ),
  ],
  child: const MyApp(),
);
