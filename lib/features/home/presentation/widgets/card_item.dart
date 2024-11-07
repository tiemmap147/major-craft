import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/theme/theme.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    Key? key,
    required this.height,
    required this.width,
    required this.assetName,
    required this.description,
  }) : super(key: key);
  final double height;
  final double width;
  final String assetName;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 105,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.neutral300),
              ),
              child: Image.asset(
                assetName,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Expanded(
            flex: 36,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                description,
                style: AppTextStyle.smallText12Regular().copyWith(color: Colors.black),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.height,
    required this.width,
    this.flexImage,
    required this.description,
    required this.imageName,
    required this.categoryItem,
    required this.price,
    required this.discount,
    required this.quantityBought,
    this.onTap,
  }) : super(key: key);
  final double height;
  final double width;
  final int? flexImage;
  final String description;
  final String imageName;
  final String categoryItem;
  final int price;
  final int discount;
  final int quantityBought;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: InkWell(
        onTap: () => {
          onTap!(),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: flexImage ?? 175,
              child: Container(
                width: width,
                decoration: const BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: AppColors.neutral300)),
                ),
                child: Image.asset(
                  imageName,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const Expanded(
              flex: 12,
              child: SizedBox(),
            ),
            Expanded(
              flex: 18,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  categoryItem,
                  style: AppTextStyle.beVietNam()
                      .copyWith(color: AppColors.neutral500, fontSize: 12.sp, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            const Expanded(
              flex: 4,
              child: SizedBox(),
            ),
            Expanded(
              flex: 107,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      description,
                      style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          '${NumberFormat().format(price)} ₫',
                          style: AppTextStyle.smallText12Regular()
                              .copyWith(color: AppColors.neutral500, decoration: TextDecoration.lineThrough),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: const BoxDecoration(
                            color: AppColors.sematicRedLight,
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                          child: Text(
                            '-${discount.toString()}%',
                            style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.secondary),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${NumberFormat().format((price * (100 - discount) / 100).floor())} ₫',
                      style: AppTextStyle.secondaryText14Semibold().copyWith(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '$quantityBought+ ${Lang.current.bought}',
                      style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.neutral600),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 12,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
