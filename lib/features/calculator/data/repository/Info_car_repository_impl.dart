import 'package:parcus/core/error/exeption.dart';
import 'package:parcus/core/params/params.dart';
import 'package:parcus/core/resourses/data_state.dart';
import 'package:parcus/features/calculator/data/data_source/info_car_data_source.dart';
import 'package:parcus/features/calculator/data/models/api_error.dart';
import 'package:parcus/features/calculator/data/models/info_car.dart';
import 'package:parcus/features/calculator/domain/repository/info_car_repository.dart';

class InfoCarRepositoryImpl implements InfoCarRepository {
  final InfoCarDataSource _infoCarDataSource;

  InfoCarRepositoryImpl(this._infoCarDataSource);
  @override
  Future<DataState<InfoCarModel, ApiErrorModel>> getInfoCar(
      {required InfoCarParams infoCar}) async {
    try {
      final response = await _infoCarDataSource.getInfoCar(infoCar: infoCar);
      return DataSuccess(response);
    } on ServerException catch (error) {
      return DataAppError(error.error);
    } on Exception {
      return const DataFailure(
          ApiErrorModel(errorMessage: 'Somesing went wrong:('));
    }
  }
}
