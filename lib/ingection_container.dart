import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:parcus/core/network/api_client.dart';
import 'package:parcus/features/calculator/data/data_source/info_car_data_source.dart';
import 'package:parcus/features/calculator/data/repository/Info_car_repository_impl.dart';
import 'package:parcus/features/calculator/domain/repository/info_car_repository.dart';
import 'package:parcus/features/calculator/domain/usecases/get_info_car.dart';
import 'package:parcus/features/calculator/presentation/bloc/info_car/info_car_cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<Client>(() => Client());
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));

  sl.registerSingleton<InfoCarDataSource>(InfoCarDataSourceImpl(sl()));

  sl.registerSingleton<InfoCarRepository>(InfoCarRepositoryImpl(sl()));
  sl.registerSingleton<GetInfoCarUsecase>(GetInfoCarUsecase(sl()));

  sl.registerFactory<InfoCarCubit>(() => InfoCarCubit(sl()));
}
