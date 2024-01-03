import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parcus/features/calculator/presentation/bloc/calc/calculator_cubit.dart';
import 'package:parcus/features/calculator/presentation/widgets/components/custom_radio_model.dart';
import 'package:parcus/features/calculator/presentation/widgets/components/emit_custom_radio_button.dart';

class CustomRadioButton<T> extends StatefulWidget {
  final List<CustomRadioParam<T>> buttonList;
  final Function onChange;
  const CustomRadioButton({
    super.key,
    required this.buttonList,
    required this.onChange,
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState<T>();
}

class _CustomRadioButtonState<T> extends State<CustomRadioButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.buttonList.map((CustomRadioParam<T> e) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            constraints: const BoxConstraints(minWidth: 130, maxWidth: 130),
            child: BlocBuilder<CalculatorCubit, CalculatorState>(
              bloc: context.read<CalculatorCubit>(),
              builder: (context, state) {
                dynamic widgetState;
                if (T == PortSelected) {
                  widgetState = state.portSelected;
                } else {
                  widgetState = state.selectedAuction;
                }
                return OutlinedButton(
                  onPressed: () {
                    widget.onChange(e.index);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    side: BorderSide(
                        width: (widgetState == e.index) ? 2.0 : 0.5,
                        color: (widgetState == e.index)
                            ? Colors.green
                            : Colors.grey.shade600),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: SvgPicture.asset(
                            e.assetName,
                            fit: BoxFit.fitWidth,
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          e.hintText,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (widgetState == e.index)
                        const Positioned(
                            top: 5,
                            right: 5,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
