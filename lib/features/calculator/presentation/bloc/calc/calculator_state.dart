part of 'calculator_cubit.dart';

class CalculatorState extends Equatable {
  const CalculatorState({
    // this.priceModel,
    this.selectedAuction,
    this.portSelected,
    this.autoPrice,
    // this.totalSum,
    // this.isFormTrue,
    // this.venLocationState,
    // this.venLocationCity,
    // this.resultApi,
    // this.infoCar,
  });

  final AuctionSelected? selectedAuction;
  final PortSelected? portSelected;
  final int? autoPrice;
  // final int? totalSum;
  // final bool? isFormTrue;
  // final String? venLocationState;
  // final String? venLocationCity;
  // final DataState<InfoCarEntity, ApiErrorEntity>? resultApi;
  // final InfoCarEntity? infoCar;

  // final PriceModel? priceModel;

  static CalculatorState initial() => CalculatorState(
        selectedAuction: AuctionSelected.copart,
        portSelected: PortSelected.klaipeda,
        autoPrice: 0,
        // totalSum: 0,
        // isFormTrue: false,
        // priceModel: PriceModel(
        //   feePrice: 0,
        //   portPrice: 0,
        //   trafficPrice: 0,
        //   brokerPrice: 0,
        //   expeditionPrice: 0,
        //   deliverMilitaryPrice: 0,
        //   companyPrice: 0,
        //   ndsTotal: 0,
        // ),
      );

  @override
  List<Object?> get props => [
        selectedAuction,
        autoPrice,
        portSelected,
        // // priceModel,
        // totalSum,
        // isFormTrue,
        // venLocationState,
        // venLocationCity,
        // resultApi,
        // infoCar
      ];

  CalculatorState copyWith({
    AuctionSelected? selectedAuction,
    int? autoPrice,
    PortSelected? portSelected,
    // // final PriceModel? priceModel,
    // int? totalSum,
    // bool? isFormTrue,
    // String? venLocationState,
    // String? venLocationCity,
    // DataState<InfoCarEntity, ApiErrorEntity>? resultApi,
    // InfoCarEntity? infoCar,
  }) {
    return CalculatorState(
      selectedAuction: selectedAuction ?? this.selectedAuction,
      portSelected: portSelected ?? this.portSelected,
      autoPrice: autoPrice ?? this.autoPrice,
      // // priceModel: priceModel ?? this.priceModel,
      // totalSum: totalSum ?? this.totalSum,
      // isFormTrue: isFormTrue ?? this.isFormTrue,
      // venLocationState: venLocationState ?? this.venLocationState,
      // venLocationCity: venLocationCity ?? this.venLocationCity,
      // resultApi: resultApi ?? this.resultApi,
      // infoCar: infoCar ?? this.infoCar,
    );
  }
}
