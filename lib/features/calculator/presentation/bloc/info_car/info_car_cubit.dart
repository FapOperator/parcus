import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parcus/core/params/params.dart';
import 'package:parcus/core/resourses/data_state.dart';
import 'package:parcus/features/calculator/domain/entities/api_error_entity.dart';
import 'package:parcus/features/calculator/domain/entities/info_car_entity.dart';
import 'package:parcus/features/calculator/domain/usecases/get_info_car.dart';
import 'package:parcus/features/calculator/presentation/widgets/components/emit_custom_radio_button.dart';

part 'info_car_state.dart';

class InfoCarCubit extends Cubit<InfoCarState> {
  final GetInfoCarUsecase _getInfoCarUsecase;
  InfoCarCubit(this._getInfoCarUsecase) : super(InfoCarInitial());

  resetState() {
    emit(InfoCarInitial());
  }

  getInfoCar(
      {required String vinCode,
      required AuctionSelected auctionSelected}) async {
    final infoCar = await _getInfoCarUsecase.call(
        params: InfoCarParams(
      vinCode: vinCode,
      auctionNumber: null,
      auctionName: auctionSelected.name,
    ));
    switch (infoCar) {
      case DataSuccess(value: final infoCar):
        emit(InfoCarLoaded(
          infoCar: infoCar,
          infoCarModifyVenType: _venTypeConvert(infoCar.venType),
          infoCarModifyEngine: _engineConvert(infoCar.engine),
        ));
      case DataAppError(error: final error):
        emit(InfoCarError(errorMessage: error));
      case DataFailure(exception: final exeption):
        emit(InfoCarError(errorMessage: exeption));
    }
  }

  String _engineConvert(String engine) {
    return (double.parse(engine.split('L')[0]) * 1000).toString();
  }

  String _venTypeConvert(String venType) {
    if (venType == 'AutoMobile' || venType.toUpperCase() == 'AUTOMOBILE') {
      return 'Auto';
    } else if (venType == 'Motorcycle') {
      return 'Moto';
    } else {
      return venType;
    }
  }
}
