import 'package:burget_app/src/presentation/theme/my_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String name;

  const ProductItem({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Container(
        width: 100,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                image,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Первый ряд
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ProductItem(
                    image: 'assets/images/Group 31.png', name: 'Tomato'),
                SizedBox(width: 16),
                ProductItem(
                    image: 'assets/images/Group 31 (2).png', name: 'Onions'),
                SizedBox(width: 16),
                ProductItem(
                    image: 'assets/images/Group 31 (1).png', name: 'Pickles'),
                SizedBox(width: 16),
                ProductItem(
                    image: 'assets/images/pngwing 18.png', name: 'Bacon'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 63.sp),
            child: Text(
              'Side options',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
              ),
            ),
          ),
          const SizedBox(height: 20), // Отступ между рядами
          // Второй ряд
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ProductItem(
                    image: 'assets/images/image 14.png', name: 'Lettuce'),
                SizedBox(width: 16),
                ProductItem(
                    image: 'assets/images/image 15.png', name: 'Cheese'),
                SizedBox(width: 16),
                ProductItem(
                    image: 'assets/images/pngwing 12.png', name: 'Beef'),
                SizedBox(width: 16),
                ProductItem(
                    image: 'assets/images/pngwing 14.png', name: 'Chicken'),
              ],
            ),
          ),
          const SizedBox(height: 20), // Отступ между рядами
          Padding(
            padding: EdgeInsets.only(right: 69.sp),
            child: Text(
              'Total',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
              ),
            ),
          ),
          const SizedBox(height: 5), // Отступ между рядами
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "\$",
                        style: TextStyle(
                          color: AppColors.pink, // Цвет для "Customize"
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '16.49',
                        style: TextStyle(
                          color: AppColors.black, // Цвет для остального текста
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 25.w),
              Container(
                height: 7.h,
                width: 42.w,
                decoration: BoxDecoration(
                  color: AppColors.pink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'ORDER NOW',
                    style: TextStyle(
                      color: AppColors.widthT,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
