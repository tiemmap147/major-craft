import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:major_craft_application/theme/theme.dart';

class ProductDetailCardDealComponent extends StatelessWidget {
  const ProductDetailCardDealComponent({
    Key? key,
    required this.height,
    required this.width,
    required this.price,
    required this.discount,
    required this.productImage,
  }) : super(key: key);
  final double height;
  final double width;
  final double price;
  final double discount;
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.neutral300),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 108,
            child: Image.asset(
              productImage,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 63,
            child: Center(
              child: Column(
                children: [
                  Text(
                    '${NumberFormat().format(price)} ₫',
                    style: AppTextStyle.smallText12Regular().copyWith(
                      color: AppColors.neutral600,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    '${NumberFormat().format((price * (100 - discount) / 100).floor())} ₫',
                    style: AppTextStyle.secondaryText14Medium().copyWith(
                      color: AppColors.secondary,
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
