import 'package:flutter/material.dart';
import 'package:fruithub/pages/searchPage.dart';
import 'package:fruithub/provider/bascet_provider.dart';
import 'package:fruithub/provider/counter_provider.dart';
import 'package:fruithub/provider/favorite_provider.dart';
import 'package:fruithub/provider/search_provider.dart';
import 'package:fruithub/router/route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("yummy");
  runApp(
    MultiProvider(
      child: const MyApp(),
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => CounterProiver()),
        ChangeNotifierProvider(create: (context) => BascetProvider()),
         ChangeNotifierProvider(create: (context) => SearchProvider()),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Hub',
      theme: ThemeData(
        fontFamily: "Yozuv",
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) => RouterGenerate.generateRoute(settings),
    );
  }
}
