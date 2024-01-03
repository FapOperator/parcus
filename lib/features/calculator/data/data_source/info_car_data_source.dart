import 'package:parcus/core/network/api_client.dart';
import 'package:parcus/core/params/params.dart';
import 'package:parcus/features/calculator/data/models/info_car.dart';

abstract class InfoCarDataSource {
  Future<InfoCarModel> getInfoCar({required InfoCarParams infoCar});
}

class InfoCarDataSourceImpl implements InfoCarDataSource {
  final ApiClient _client;

  InfoCarDataSourceImpl(this._client);
  @override
  Future<InfoCarModel> getInfoCar({required InfoCarParams infoCar}) async {
    final response = await _client.get(
      'copart',
      params: <String, dynamic>{
        "auction_name": infoCar.auctionName,
        "vin": infoCar.vinCode,
        "auction_number": infoCar.auctionNumber,
      },
    ) as Map<String, dynamic>;
    final result = InfoCarModel.fromJson(response);
    return result;
  }
}
