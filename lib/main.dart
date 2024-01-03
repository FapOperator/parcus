import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parcus/features/calculator/domain/usecases/get_info_car.dart';
import 'package:parcus/features/calculator/presentation/bloc/calc/calculator_cubit.dart';
import 'package:parcus/features/calculator/presentation/bloc/info_car/info_car_cubit.dart';
import 'package:parcus/features/calculator/presentation/pages/home/home.dart';
import 'package:parcus/ingection_container.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const ParcusWeb());
}

class ParcusWeb extends StatelessWidget {
  const ParcusWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: darkBlue, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => InfoCarCubit(sl<GetInfoCarUsecase>()),
            ),
            BlocProvider(
              create: (context) =>
                  CalculatorCubit(context.read<InfoCarCubit>()),
            ),
          ],
          child: const HomePage(),
        ),
      ),
    );
  }
}
