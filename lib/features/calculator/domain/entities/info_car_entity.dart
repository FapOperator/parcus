import 'package:equatable/equatable.dart';

class InfoCarEntity extends Equatable {
  final String carModel;
  final String vinCode;
  final String venType;
  final String engine;
  final String fuelType;
  final String document;
  final String venLocation;
  final String selliingBranch;

  const InfoCarEntity({
    required this.carModel,
    required this.vinCode,
    required this.venType,
    required this.engine,
    required this.fuelType,
    required this.document,
    required this.venLocation,
    required this.selliingBranch,
  });

  @override
  List<Object?> get props => [
        carModel,
        vinCode,
        venType,
        engine,
        fuelType,
        document,
        venLocation,
        selliingBranch,
      ];
}
