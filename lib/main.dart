import 'package:flutter/material.dart';
import 'package:kaira/providers/city_provider.dart';
import 'package:kaira/providers/container_provider.dart';
import 'package:kaira/providers/containertype_provider.dart';
import 'package:kaira/providers/expense_provider.dart';
import 'package:kaira/screens/btm_bar.dart';
import 'package:kaira/screens/city/city_details_screen.dart';
import 'package:kaira/screens/continertype/containertyppe_detail.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CityProvider()),
        ChangeNotifierProvider(create: (context) => ContainerTypeProvider()),
        ChangeNotifierProvider(create: (context) => ContainerProvider()),
        ChangeNotifierProvider(create: (context) => ExpenseProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BottomBarScreen(),
        routes: {
          CityDetailScreen.routeName: (context) => const CityDetailScreen(),
          CtypeDetailScreen.routeName: (context) => const CtypeDetailScreen()
        });
  }
}
