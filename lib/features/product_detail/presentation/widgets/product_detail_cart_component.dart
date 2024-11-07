import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/theme.dart';

class ProductDetailCartComponent extends StatelessWidget {
  const ProductDetailCartComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        SizedBox(
          width: 53.w,
          height: 40.h,
        ),
        SvgPicture.asset(Assets.images.cartSearchBarHome.path),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            width: 36.w,
            height: 24.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Text(
              '+99',
              style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.black),
            ),
          ),
        ),
      ],
    );
  }
}
