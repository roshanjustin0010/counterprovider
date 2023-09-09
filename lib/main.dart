import 'package:counter_provider/bmiCalcuProv/bmi_home_page.dart';
import 'package:counter_provider/bmiCalcuProv/providerBmi/bmi_provider_model.dart';
import 'package:counter_provider/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<CounterModel>(create: (context) => CounterModel()),
      ChangeNotifierProvider<BmiProvider>(create: (context) => BmiProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'flutter Provider Demo App'),
        '/bmiCalculator': (context) => const BmiHome(),
      },
      initialRoute: '/',
    );
  }
}
