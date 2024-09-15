import 'package:burget_app/src/presentation/details/products.dart';
import 'package:flutter/material.dart';
import 'package:burget_app/src/presentation/theme/my_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double _sliderValue = 0.5; // Начальное значение слайдера
  int _quantity = 1; // Для отслеживания количества

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.widthT,
      appBar: AppBar(
        backgroundColor: AppColors.widthT,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Image.asset(
                    'assets/images/chis.png',
                    height: 33.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 8.h,
                    left: 5.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Customize',
                              style: TextStyle(
                                color: AppColors.black, // Цвет для "Customize"
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' Your Burger \n to Your Tastes. Ultimate \n Experience',
                              style: TextStyle(
                                color: AppColors
                                    .black, // Цвет для остального текста
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h), // Отступ между текстом и слайдером
                      Text(
                        'Spicy',
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                      SliderTheme(
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
                              overlayRadius:
                                  20), // Добавление области для нажатия
                          trackHeight: 4, // Высота трека слайдера
                        ),
                        child: Slider(
                          value: _sliderValue,
                          min: 0,
                          max: 1,
                          divisions: 5,
                          onChanged: (double value) {
                            setState(() {
                              _sliderValue =
                                  value; // Обновляем значение слайдера
                            });
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 1.w),
                            child: Text(
                              'Mild',
                              style: TextStyle(
                                color: AppColors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 31.w),
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
                      SizedBox(height: 6.h),
                      Text(
                        'Portion',
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_quantity > 1)
                                  _quantity--; // Уменьшаем количество
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
                          SizedBox(width: 10.w),
                          Text(
                            '$_quantity',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10.w),
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
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 69.sp),
              child: Text(
                'Toppings',
                style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
              ),
            ),
            const Products(),
          ],
        ),
      ),
    );
  }
}
