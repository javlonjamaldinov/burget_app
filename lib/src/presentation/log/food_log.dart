import 'dart:async';
import 'package:burget_app/src/presentation/home/home_page.dart';
import 'package:burget_app/src/presentation/theme/my_color.dart';
import 'package:burget_app/src/presentation/widgets/buttom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FoodLog extends StatefulWidget {
  const FoodLog({super.key});

  @override
  _FoodLogState createState() => _FoodLogState();
}

class _FoodLogState extends State<FoodLog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>  ButtomNavBar(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.width,
                    AppColors.pink,
                  ],
                  stops: [
                    0.2,
                    0.7,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 35.h),
                    child: Text(
                      "Foodgo",
                      style: TextStyle(
                        fontFamily: 'PlaywriteCU',
                        fontWeight: FontWeight.bold,
                        color: AppColors.widthT,
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  SizedBox(
                    height: 30.h, // Responsive height
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 23.w, top: 15.h), // Responsive padding
                            child: Image.asset(
                              'assets/images/burger1.png',
                              width: 50.w, // Responsive width
                              height: 15.h, // Responsive height
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 10.w, top: 8.h), // Responsive padding
                            child: Image.asset(
                              'assets/images/burger2.png',
                              width: 40.w, // Responsive width
                              height: 22.h, // Responsive height
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
