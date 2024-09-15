import 'package:burget_app/src/data/model/my_food.dart';
import 'package:burget_app/src/presentation/page/order_page.dart';
import 'package:burget_app/src/presentation/theme/my_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Content extends StatefulWidget {
  final int foodIndex;
  const Content({super.key, required this.foodIndex});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  void _navigateToOrderPage() {
    Navigator.of(context).push(_createPageRoute());
  }

  PageRouteBuilder _createPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        // Переход на OrderPage
        return const OrderPage();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Анимация открытия снизу
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final foodItem =
        foodDataScreen[widget.foodIndex]; // Получаем данные по индексу

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.sp),
          child: Container(
            height: 8.h,
            width: 25.w,
            decoration: BoxDecoration(
              color: AppColors.pink,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                '${foodItem['purchase']}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.widthT,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: _navigateToOrderPage,
          child: Container(
            height: 9.h,
            width: 55.w,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                'ORDER NOW',
                style: TextStyle(
                  color: AppColors.widthT,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
