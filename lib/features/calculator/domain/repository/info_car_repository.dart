import 'package:parcus/core/params/params.dart';
import 'package:parcus/core/resourses/data_state.dart';
import 'package:parcus/features/calculator/domain/entities/api_error_entity.dart';
import 'package:parcus/features/calculator/domain/entities/info_car_entity.dart';

abstract class InfoCarRepository {
  Future<DataState<InfoCarEntity, ApiErrorEntity>> getInfoCar({
    required InfoCarParams infoCar,
  });
}
