import 'package:nimbus/App/App.dart';
import 'package:nimbus/Controllers/NavigationController.dart';
import 'package:nimbus/Controllers/OnboardingScreenController.dart';
import 'package:nimbus/Controllers/impl/NavigationControllerImpl.dart';
import 'package:nimbus/Controllers/impl/OnboardingScreenControllerImpl.dart';
import 'package:nimbus/Services/NavigationService.dart';
import 'package:nimbus/Services/impl/NavigationServiceImpl.dart';
import 'package:provider/provider.dart';

final MultiProvider providerHandler = MultiProvider(
  providers: [
    Provider<NavigationService>(
      create: (context) => NavigationServiceImpl.instance,
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
  ],
  child: const MyApp(),
);
