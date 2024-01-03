import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parcus/features/calculator/presentation/bloc/calc/calculator_cubit.dart';
import 'package:parcus/features/calculator/presentation/bloc/info_car/info_car_cubit.dart';
import 'package:parcus/features/calculator/presentation/widgets/components/car_details_container.dart';
import 'package:parcus/features/calculator/presentation/widgets/components/custom_radio_model.dart';
import 'package:parcus/features/calculator/presentation/widgets/components/custum_radio_button.dart';
import 'package:parcus/features/calculator/presentation/widgets/components/emit_custom_radio_button.dart';

class InfoCarBody extends StatefulWidget {
  const InfoCarBody({
    super.key,
  });

  @override
  State<InfoCarBody> createState() => _InfoCarBodyState();
}

class _InfoCarBodyState extends State<InfoCarBody> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController vinCodeController = TextEditingController();
  String vinCodeControllerCopy = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(minWidth: 100, maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Выбор аукциона',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRadioButton<AuctionSelected>(
                        onChange: (AuctionSelected selectedAuction) {
                          vinCodeController.text = '';
                          context
                              .read<CalculatorCubit>()
                              .selectedAuction(selectedAuction);
                        },
                        buttonList: [
                          CustomRadioParam<AuctionSelected>(
                            assetName: 'assets/copartlogo.svg',
                            index: AuctionSelected.copart,
                            hintText: 'COPART',
                          ),
                          CustomRadioParam<AuctionSelected>(
                            assetName: 'assets/iaai.svg',
                            index: AuctionSelected.iaai,
                            hintText: 'IAAI',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                          textInputAction: TextInputAction.next,
                          maxLength: 17,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            return value!.length < 17 && value.isNotEmpty
                                ? 'Номер должен иметь 17 символов'
                                : null;
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            counterStyle: const TextStyle(color: Colors.black),
                            labelText: 'Номер лота или vin номер авто',
                            filled: false,
                            labelStyle: const TextStyle(color: Colors.black),
                            fillColor: Colors.grey[200],
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade600)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade600)),
                          ),
                          controller: vinCodeController,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();

                            if (_formKey.currentState!.validate() &&
                                vinCodeController.text.isNotEmpty &&
                                vinCodeControllerCopy !=
                                    vinCodeController.text) {
                              vinCodeControllerCopy = vinCodeController.text;
                              context.read<InfoCarCubit>().getInfoCar(
                                  vinCode: vinCodeController.text,
                                  auctionSelected: state.selectedAuction!);
                            } else {
                              vinCodeControllerCopy = vinCodeController.text;
                            }
                          },
                          onEditingComplete: () {
                            if (_formKey.currentState!.validate() &&
                                vinCodeController.text.isNotEmpty &&
                                vinCodeControllerCopy !=
                                    vinCodeController.text) {
                              vinCodeControllerCopy = vinCodeController.text;
                              context.read<InfoCarCubit>().getInfoCar(
                                  vinCode: vinCodeController.text,
                                  auctionSelected: state.selectedAuction!);
                            } else {
                              vinCodeControllerCopy = vinCodeController.text;
                            }
                          }),
                    ),
                  ),
                  BlocBuilder<InfoCarCubit, InfoCarState>(
                    buildWhen: (previous, current) => previous != current,
                    builder: (context, infoCarstate) {
                      if (infoCarstate is InfoCarError) {
                        return Text(
                          infoCarstate.errorMessage.errorMessage,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        );
                      }
                      if (infoCarstate is InfoCarLoaded) {
                        return Column(
                          children: [
                            CarDetailsContainer(
                              titleContainer: 'Марка авто',
                              infoCar: infoCarstate.infoCar.carModel,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CarDetailsContainer(
                                          titleContainer: 'Вин номер',
                                          infoCar: infoCarstate.infoCar.vinCode,
                                        ),
                                        CarDetailsContainer(
                                          titleContainer: 'Обьем ДВС',
                                          infoCar:
                                              infoCarstate.infoCarModifyEngine,
                                        ),
                                      ]),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CarDetailsContainer(
                                          titleContainer: 'Тип ТЗ',
                                          infoCar:
                                              infoCarstate.infoCarModifyVenType,
                                        ),
                                        CarDetailsContainer(
                                          titleContainer: 'Документ',
                                          infoCar:
                                              infoCarstate.infoCar.document,
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                            CarDetailsContainer(
                              titleContainer: 'Место нахождения',
                              infoCar: infoCarstate.infoCar.venLocation,
                            ),
                          ],
                        );
                      } else {
                        return const Text(
                          textAlign: TextAlign.center,
                          'Введите vin номер машины для получение информации о машине',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
