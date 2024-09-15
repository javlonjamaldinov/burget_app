import 'package:burget_app/src/presentation/log/food_log.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart'; // Импортируем ResponsiveSizer

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FoodLog(),
        );
      },
    );
  }
}
