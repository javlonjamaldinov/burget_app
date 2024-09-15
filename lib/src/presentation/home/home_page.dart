import 'package:burget_app/src/components/my_container.dart';
import 'package:burget_app/src/data/local/my_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:burget_app/src/presentation/theme/my_color.dart';
import 'package:burget_app/src/components/my_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> isSelected = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.widthT,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      "Foodgo",
                      style: TextStyle(
                        fontFamily: 'PlaywriteCU',
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Container(
                      height: 31.sp,
                      width: 31.sp,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/girl.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40.w),
              child: Text(
                "Order your favourite food!",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                  fontSize: 16.sp,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            const Search(),
            SizedBox(height: 4.h),
            SizedBox(
              height: 6.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: text.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          isSelected[i] = i == index;
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected[index]
                            ? AppColors.pink
                            : AppColors.greyK,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        text[index],
                        style: TextStyle(
                          color:
                              isSelected[index] ? Colors.white : AppColors.grey,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 1.h),
            const MyContainer(),
          ],
        ),
      ),
    );
  }
}
