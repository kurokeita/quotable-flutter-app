// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../database/author.repository.dart';
import '../database/quote.repository.dart';
import '../services/api_service.dart';
import '../services/authentication_service.dart';
import '../services/authors/author_service.dart';
import '../services/database_service.dart';
import '../services/quotes/quote_of_the_day_service.dart';
import '../services/quotes/quote_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => QuoteRepository());
  locator.registerLazySingleton(() => AuthorRepository());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => QuoteOfTheDayService());
  locator.registerLazySingleton(() => QuoteService());
  locator.registerLazySingleton(() => AuthorService());
}
