import 'package:parcus/features/calculator/domain/entities/info_car_entity.dart';

class InfoCarModel extends InfoCarEntity {
  const InfoCarModel(
      {required super.carModel,
      required super.vinCode,
      required super.venType,
      required super.engine,
      required super.fuelType,
      required super.document,
      required super.venLocation,
      required super.selliingBranch});

  factory InfoCarModel.fromJson(Map<String, dynamic> map) {
    return InfoCarModel(
      carModel: map['title'] ?? '',
      vinCode: map['vin_number'] ?? '',
      venType: map['vehicle'] ?? '',
      engine: map['engine'] ?? '',
      fuelType: map['fuel_type'] ?? '',
      document: map['document_info'] ?? '',
      venLocation: map['vehicle_location'] ?? '',
      selliingBranch: map['selliing_branch'] ?? '',
    );
  }
}
