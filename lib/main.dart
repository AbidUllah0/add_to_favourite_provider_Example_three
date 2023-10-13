import 'package:add_favourite_provider3/provider/favourite_provider.dart';
import 'package:add_favourite_provider3/screens/add_favorite_with_provider.dart';
import 'package:add_favourite_provider3/screens/add_favorite_without_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavouriteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AddFavouriteWithProvider(),
      ),
    );
  }
}
