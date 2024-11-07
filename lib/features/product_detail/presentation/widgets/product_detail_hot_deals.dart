import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/features/product_detail/presentation/widgets/product_detail_card_deal.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/theme.dart';

class ProductDetailHotDeals extends StatelessWidget {
  const ProductDetailHotDeals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 297.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 32.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot Deals',
                  style: AppTextStyle.primaryText16Semibold().copyWith(
                    color: AppColors.black,
                  ),
                ),
                Text(
                  'View more',
                  style: AppTextStyle.secondaryText14Regular().copyWith(
                    color: AppColors.neutral600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 171.h,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: ProductDetailCardDealComponent(
                          height: 171.h,
                          width: 104.w,
                          price: 550000,
                          discount: 10,
                          productImage: Assets.images.imageProduct1.path,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                    ],
                  );
                }
                
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: ProductDetailCardDealComponent(
                    height: 171.h,
                    width: 104.w,
                    price: 550000,
                    discount: 10,
                    productImage: Assets.images.imageProduct1.path,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 46.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal ',
                            style: AppTextStyle.secondaryText14Regular().copyWith(
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            '520.000 ₫',
                            style: AppTextStyle.secondaryText14Semibold().copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Savings ',
                          style: AppTextStyle.secondaryText14Regular().copyWith(
                            color: AppColors.sematicSuccess,
                          ),
                        ),
                        Text(
                          '520.000 ₫',
                          style: AppTextStyle.secondaryText14Semibold().copyWith(
                            color: AppColors.sematicSuccess,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 32.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Add deal now',
                    style: AppTextStyle.secondaryText14Regular().copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
