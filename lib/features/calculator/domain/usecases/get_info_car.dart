import 'package:parcus/core/params/params.dart';
import 'package:parcus/core/resourses/data_state.dart';
import 'package:parcus/core/usecases/usecase.dart';
import 'package:parcus/features/calculator/domain/entities/api_error_entity.dart';
import 'package:parcus/features/calculator/domain/entities/info_car_entity.dart';
import 'package:parcus/features/calculator/domain/repository/info_car_repository.dart';

class GetInfoCarUsecase implements Usecase<InfoCarEntity, InfoCarParams> {
  final InfoCarRepository _infoCarRepository;

  GetInfoCarUsecase(this._infoCarRepository);
  @override
  Future<DataState<InfoCarEntity, ApiErrorEntity>> call(
      {required InfoCarParams params}) {
    return _infoCarRepository.getInfoCar(infoCar: params);
  }
}
