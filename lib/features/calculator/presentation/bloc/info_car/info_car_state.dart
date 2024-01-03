part of 'info_car_cubit.dart';

sealed class InfoCarState extends Equatable {
  const InfoCarState();

  @override
  List<Object> get props => [];
}

final class InfoCarInitial extends InfoCarState {
  @override
  List<Object> get props => [];
}

final class InfoCarLoading extends InfoCarState {}

final class InfoCarLoaded extends InfoCarState {
  final InfoCarEntity infoCar;
  final String infoCarModifyVenType;
  final String infoCarModifyEngine;

  const InfoCarLoaded({
    required this.infoCarModifyVenType,
    required this.infoCarModifyEngine,
    required this.infoCar,
  });

  @override
  List<Object> get props => [
        infoCar,
        infoCarModifyVenType,
        infoCarModifyEngine,
      ];
}

final class InfoCarError extends InfoCarState {
  final ApiErrorEntity errorMessage;

  const InfoCarError({required this.errorMessage});
}
