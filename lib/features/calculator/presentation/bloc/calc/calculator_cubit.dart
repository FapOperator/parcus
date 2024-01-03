import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parcus/features/calculator/presentation/bloc/info_car/info_car_cubit.dart';
import 'package:parcus/features/calculator/presentation/widgets/components/emit_custom_radio_button.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  // final PriceRepository _priceRepository;
  final InfoCarCubit _infoCarCubit;
  CalculatorCubit(this._infoCarCubit) : super(CalculatorState.initial());

  selectedAuction(AuctionSelected selectedAuction) {
    emit(CalculatorState.initial());
    emit(state.copyWith(selectedAuction: selectedAuction));
    _infoCarCubit.resetState();
    // _infoCarCubit.emit(InfoCarInitial());
    // permissionGetInfo(state.autoPrice!);
  }

  // permissionGetInfo(
  //   int price,
  // ) async {
  //   Result<PriceModel, ErrorModel> resultApi;

  //   if (price != 0) {
  //     resultApi = await getAllPrice(price);
  //     emit(state.copyWith(resultApi: resultApi, autoPrice: price));
  //     calculationTotalSum();
  //   }
  // }

  // writeInfoCar(InfoCarModel infoCar) {
  //   emit(state.copyWith(infoCar: infoCar));
  // }

  // writeVenLocation(String venLocation, String selliingBranch) {
  //   String venLocationState = '';
  //   String venLocationCity = '';

  //   if (state.selectedAuction == AuctionSelected.copart) {
  //     venLocationState = selliingBranch.split(' - ')[0];
  //     venLocationCity = selliingBranch.split(' - ')[1];
  //   } else if (state.selectedAuction == AuctionSelected.iaai) {
  //     if (venLocation == 'At the branch') {
  //       List<String> splitString = selliingBranch.split(" ");
  //       venLocationCity = splitString[0];
  //       venLocationState = splitString[1].substring(1, 3);
  //     } else {
  //       venLocationState = venLocation.split(', ')[1];
  //       venLocationCity = venLocation.split(', ')[0];
  //     }
  //   }
  //   return emit(
  //     state.copyWith(
  //       venLocationCity: venLocationCity,
  //       venLocationState: venLocationState,
  //     ),
  //   );
  // }

  // portSelected(PortSelected portSelected) {
  //   emit(state.copyWith(portSelected: portSelected));
  //   permissionGetInfo(state.autoPrice!);
  // }

  // getPriceAuto(String price) async {
  //   int intPrice = int.parse(price);
  //   permissionGetInfo(intPrice);
  // }

  // String engineConvert(String engine) {
  //   return (double.parse(engine.split('L')[0]) * 1000).toString();
  // }

  // Future<dynamic> getAllPrice(int price) async {
  //   List<String> splitStringModelCar = state.infoCar!.carModel.split(' ');
  //   String carYear = '';
  //   for (int i = 0; i <= splitStringModelCar.length; i++) {
  //     if (splitStringModelCar[i].contains('20')) {
  //       carYear = splitStringModelCar[i];
  //       break;
  //     }
  //   }
  //   int capacityToInt = int.parse(engineConvert(state.infoCar!.engine));
  //   int carYearToInt = int.parse(carYear);
  //   final resultApi = await _priceRepository.getAllPrice(
  //     autoPrice: price,
  //     selectedAuction: state.selectedAuction!.name,
  //     endCity: state.portSelected!.name,
  //     venLocationCity: state.venLocationCity!,
  //     venLocationState: state.venLocationState!,
  //     capacity: capacityToInt,
  //     year: carYearToInt,
  //     fuelType: state.infoCar!.fuelType,
  //   );
  //   return resultApi;
  // }

  // calculationTotalSum() {
  //   switch (state.resultApi) {
  //     case Success(value: final priceModel):
  //       {
  //         int totalSum = (state.autoPrice)! +
  //             (priceModel.feePrice) +
  //             (priceModel.trafficPrice) +
  //             (priceModel.portPrice) +
  //             (priceModel.companyPrice) +
  //             (priceModel.expeditionPrice) +
  //             (priceModel.deliverMilitaryPrice) +
  //             (priceModel.brokerPrice);
  //         emit(state.copyWith(totalSum: totalSum));
  //       }
  //     default:
  //       0;
  //   }
  // }
}
