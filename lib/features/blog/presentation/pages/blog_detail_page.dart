import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:major_craft_application/core/localization/localization.dart';
import 'package:major_craft_application/core/widgets/shared/ink_well_with_feedback.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common.dart';
import 'package:major_craft_application/features/home/data/models/card_model.dart';
import 'package:major_craft_application/features/home/presentation/widgets/card_item.dart';
import 'package:major_craft_application/major_craft_data.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class BlogDetailPage extends StatefulWidget {
  const BlogDetailPage({super.key});

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCommon(
      hasAppBar: true,
      title: Text(
        'Reading blog',
        style: AppTextStyle.primaryText16Medium(),
      ),
      leading: InkWellWithFeedback(
        onTap: () => {
          context.router.pop(),
        },
        child: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: SvgPicture.asset(
            Assets.icons.accountBack.path,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${Lang.current.published} ${MajorCraftData.blogDetail.createdAt}',
                      style: AppTextStyle.smallText12Regular().copyWith(
                        color: AppColors.neutral700,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      MajorCraftData.blogDetail.title,
                      style: AppTextStyle.primaryText16Semibold().copyWith(
                        color: AppColors.primary400,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      MajorCraftData.blogDetail.content,
                      style: AppTextStyle.secondaryText14Medium().copyWith(
                        color: AppColors.neutral700,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Lang.current.shareThisPost,
                          style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.neutral700),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 32.h,
                              // width: 133.w,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                  ),
                                  side: const BorderSide(
                                    color: AppColors.black,
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 6.h),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.icons.blogCopy.path,
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      Lang.current.copyLink,
                                      style: AppTextStyle.secondaryText14Regular(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            SizedBox(
                              height: 32.h,
                              width: 50.w,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                  ),
                                  side: const BorderSide(
                                    color: AppColors.black,
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.icons.blogFacebook.path,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            SizedBox(
                              height: 32.h,
                              width: 50.w,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                  ),
                                  side: const BorderSide(
                                    color: AppColors.black,
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.icons.blogTwitter.path,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const RecommendedWidget(),
            SizedBox(
              height: 16.h,
            ),
            RelatedWidget(),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}

class RelatedWidget extends StatelessWidget {
  RelatedWidget({
    super.key,
  });
  final CardModel card = CardModel(
    description:
        'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
    imageName: Assets.images.imageProduct1.path,
    categoryItem: 'CLOTHING',
    price: 320000,
    discount: 10,
    quantityBought: 40,
  );
  final List<CardModel> cards = [
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 303.h + 44.h,
      child: Column(
        children: [
          SizedBox(
            height: 44.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Lang.current.relatedProducts,
                    style: AppTextStyle.barlow(),
                  ),
                  Text(
                    Lang.current.viewAll,
                    style: AppTextStyle.secondaryText14Regular()
                        .copyWith(decoration: TextDecoration.underline, color: AppColors.black),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: CardWidget(
                    flexImage: 150,
                    height: 303.h,
                    width: 150.w,
                    description: cards[index].description,
                    imageName: cards[index].imageName,
                    categoryItem: cards[index].categoryItem,
                    price: cards[index].price,
                    discount: cards[index].discount,
                    quantityBought: cards[index].quantityBought,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 227.h + 44.h,
      child: Column(
        children: [
          SizedBox(
            height: 44.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Lang.current.recommendedArticles,
                    style: AppTextStyle.barlow(),
                  ),
                  Text(
                    Lang.current.viewAll,
                    style: AppTextStyle.secondaryText14Regular()
                        .copyWith(decoration: TextDecoration.underline, color: AppColors.black),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              itemCount: MajorCraftData.listBlog.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: SizedBox(
                    width: 200.w,
                    child: Column(
                      children: [
                        Container(
                          color: AppColors.white,
                          width: 200.w,
                          height: 133.h,
                          child: Image.asset(
                            MajorCraftData.listBlog[index].imageSrc,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          color: AppColors.white,
                          height: 94.h,
                          padding: EdgeInsets.only(bottom: 12.h, top: 8.h, left: 12.w, right: 12.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    MajorCraftData.listBlog[index].createdAt,
                                    style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.neutral600),
                                  ),
                                  Container(
                                    width: 2.w,
                                    height: 2.h,
                                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                                    decoration: const BoxDecoration(
                                      color: AppColors.neutral600,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    MajorCraftData.listBlog[index].readedTime,
                                    style: AppTextStyle.smallText12Regular().copyWith(
                                      color: AppColors.neutral600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                MajorCraftData.listBlog[index].content,
                                style: AppTextStyle.secondaryText14Regular().copyWith(
                                  color: AppColors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
