import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/features/home/presentation/widgets/card_item.dart';
import 'package:major_craft_application/major_craft_data.dart';

class HomeSearchResultHasDataComponent extends StatelessWidget {
  const HomeSearchResultHasDataComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 12.h, top: 12.h),
      physics: const BouncingScrollPhysics(),
      itemCount: MajorCraftData.listFishingProduct.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.w,
        childAspectRatio: 175.5.w / 328.5.h,
      ),
      itemBuilder: (context, index) {
        return CardWidget(
          height: double.infinity,
          width: double.infinity,
          description: MajorCraftData.listFishingProduct[index].description,
          imageName: MajorCraftData.listFishingProduct[index].imageName,
          categoryItem: MajorCraftData.listFishingProduct[index].categoryItem,
          price: MajorCraftData.listFishingProduct[index].price,
          discount: MajorCraftData.listFishingProduct[index].discount,
          quantityBought: MajorCraftData.listFishingProduct[index].quantityBought,
        );
      },
    );
  }
}
