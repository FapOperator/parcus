import 'package:flutter/material.dart';
import 'package:parcus/features/calculator/presentation/widgets/info_car.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 800),
      color: const Color(0xFFE7E7E7),
      padding: const EdgeInsets.all(16),
      child: const Card(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              InfoCarBody(),
              // CalculationBody(),
            ],
          ),
        ),
      ),
    );
  }
}
