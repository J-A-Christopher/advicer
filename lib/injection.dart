import 'package:advisor/0_data/datasources/advice_remote_datasource.dart';
import 'package:advisor/0_data/repositories/advice_repo_implementations.dart';
import 'package:advisor/1_domain/repositories/advice_repo.dart';
import 'package:advisor/1_domain/usecases/advice_usecases.dart';
import 'package:advisor/3_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.I;

// Future<void> init() async {
//   //Aplication Layer
//   //Factory = everytime a new/fresh instance of that class
//   serviceLocator.registerFactory<RemoteAdviceDataSourceImpl>(
//       () => RemoteAdviceDataSourceImpl(client: serviceLocator()));

//   //data Layer
//   serviceLocator.registerFactory<AdviceRepoImpl>(
//       () => AdviceRepoImpl(adviceRemoteDataSource: serviceLocator()));

//   //domain Layer
//   serviceLocator.registerFactory<AdviceUseCases>(
//       () => AdviceUseCases(adviceRepo: serviceLocator()));

//   serviceLocator.registerFactory<AdvicerCubit>(
//       () => AdvicerCubit(adviceuseCases: serviceLocator()));

// //externs where we our http
//   serviceLocator.registerFactory(() => http.Client());
// }

Future<void> init() async {
  // Application Layer
  serviceLocator.registerFactory<RemoteAdviceDataSourceImpl>(
      () => RemoteAdviceDataSourceImpl(client: serviceLocator()));

  // Data Layer
  serviceLocator.registerFactory<AdviceRepoImpl>(() => AdviceRepoImpl(
      adviceRemoteDataSource: serviceLocator<RemoteAdviceDataSourceImpl>()));

  // Domain Layer
  serviceLocator.registerFactory<AdviceUseCases>(
      () => AdviceUseCases(adviceRepo: serviceLocator<AdviceRepoImpl>()));

  serviceLocator.registerFactory<AdvicerCubit>(
      () => AdvicerCubit(adviceuseCases: serviceLocator<AdviceUseCases>()));

  // Externs where we use http
  serviceLocator.registerFactory(() => http.Client());
}
