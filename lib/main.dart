import 'package:flutter/material.dart';
import 'package:restaurant_ziro/navigation.dart';
import 'package:restaurant_ziro/presentation/detail_page.dart';
import 'package:restaurant_ziro/presentation/search_page.dart';

import 'presentation/home_page.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: homePageRoute,
      routes: {
        homePageRoute: (context) => const HomePage(),
        detailRestaurantPageRoute: (context) => const DetailPage(),
        searchRestaurantPageRoute: (context) => const SearchPage(),
      },
      home: const HomePage(),
    );
  }
}
