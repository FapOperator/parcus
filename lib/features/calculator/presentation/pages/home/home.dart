import 'package:flutter/material.dart';
import 'package:parcus/features/calculator/presentation/widgets/app_bar.dart';
import 'package:parcus/features/calculator/presentation/widgets/body.dart';
import 'package:parcus/features/calculator/presentation/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final colors = <Color>[Colors.indigo, Colors.blue, Colors.orange, Colors.red];
  late Animation<double> animationBodySlide;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    Tween<double> bodySlide = Tween<double>(begin: 0.0, end: 250.0);
    animationBodySlide = bodySlide.animate(controller);
    animationBodySlide.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedOverflowBox(
            size: Size(animationBodySlide.value, double.infinity),
            child: const LeftDrawer(),
          ),
          Expanded(
            child: Column(
              children: [
                ParcusAppBar(controller: controller),
                Container(
                  height: 1,
                  color: Colors.black12,
                ),
                Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: const Row(
                      children: [
                        Text(
                          'Калькулятор',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: ListView(
                    children: const [
                      HomeBody(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
