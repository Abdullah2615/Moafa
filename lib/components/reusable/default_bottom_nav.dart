import 'package:doctor/core/controllers/main/main_view_controller.dart';
import 'package:doctor/utils/styles/used_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DefaultBottomNav extends GetView<MainViewController> {
  const DefaultBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:70.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyStyles.whiteColor,
          border: Border(top: BorderSide(width: 1, color: MyStyles.grey))
      ),
      child: Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            bool selected = controller.currentScreen.value == index;
            return GestureDetector(
              onTap: (){
                controller.setCurrentIndex = index;
              },
              child: AnimatedContainer(
                  width: 40.w,
                  height: 40.w,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: selected ? MyStyles.maybeCyanColor : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(controller.bottomIcons[index],color: selected ? Colors.white : MyStyles.maybeCyanColor, size: selected ? 18.sp : 20.sp)),
            );
          }
          )
      )),
    );
  }
}

