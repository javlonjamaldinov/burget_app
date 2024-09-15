import 'package:burget_app/src/data/model/my_food.dart';
import 'package:burget_app/src/presentation/details/content.dart';
import 'package:burget_app/src/presentation/theme/my_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FoodDetailScreen extends StatefulWidget {
  final int foodIndex;

  const FoodDetailScreen({super.key, required this.foodIndex});

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  double _sliderValue = 0.5; // Начальное значение слайдера
  int _quantity = 1; // Для отслеживания количества

  @override
  Widget build(BuildContext context) {
    final foodItem =
        foodDataScreen[widget.foodIndex]; // Получаем данные по индексу

    return Scaffold(
      backgroundColor: AppColors.widthT,
      appBar: AppBar(
        backgroundColor: AppColors.widthT,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 20.sp,
            color: AppColors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Возвращает на предыдущий экран
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 20.sp,
              color: AppColors.black,
            ),
            onPressed: () {
              // Логика для поиска
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              foodItem['image']!,
              height: 70.sp,
              width: 70.sp,
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.only(right: 1.h, left: 2.h),
              child: Text(
                foodItem['name']!,
                style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                    size: 20,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    '${foodItem['price']}',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    '${foodItem['min']}',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Text(
                foodItem['description'] ?? 'No description available',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    'Spicy',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(width: 52.w),
                Text(
                  'Portion',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 17.w),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: AppColors.pink,
                      inactiveTrackColor: AppColors.widthT.withOpacity(0.3),

                      thumbColor: AppColors.pink,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius:
                            10, // Увеличенный радиус для лучшего визуального восприятия
                      ),
                      overlayColor: AppColors.pink.withOpacity(0.2),
                      overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 20), // Добавление области для нажатия
                      trackHeight: 4, // Высота трека слайдера
                    ),
                    child: Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 1,
                      divisions: 10,
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value; // Обновляем значение слайдера
                        });
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_quantity > 1) _quantity--; // Уменьшаем количество
                    });
                  },
                  child: Container(
                    height: 5.h,
                    width: 11.w,
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.remove,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 3.w),
                Text(
                  '$_quantity',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 3.w),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _quantity++; // Увеличиваем количество
                    });
                  },
                  child: Container(
                    height: 5.h,
                    width: 11.w,
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 19.sp),
                  child: Text(
                    'Mild',
                    style: TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(width: 27.w),
                Text(
                  'Hot',
                  style: TextStyle(
                    color: AppColors.pink,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Content(foodIndex: widget.foodIndex),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }
}
