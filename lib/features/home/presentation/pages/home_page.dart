import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/core/constants/widget_keys.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/core/widgets/shared/ink_well_with_feedback.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common_search_bar.dart';
import 'package:major_craft_application/dependency_injection.dart';
import 'package:major_craft_application/features/cart/presentation/pages/cart_page.dart';
import 'package:major_craft_application/features/home/presentation/bloc/home_bloc.dart';
import 'package:major_craft_application/features/home/presentation/widgets/card_item.dart';
import 'package:major_craft_application/major_craft_data.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/service/navigation_service.dart';
import 'package:major_craft_application/theme/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: WidgetKeys.homeNavigatorKey,
      onGenerateRoute: (settings) {
        final widget = BlocProvider<HomeBloc>(
          create: (context) => DependencyInjection.instance(),
          child: const HomeWrapper(),
        );

        return MaterialPageRoute(builder: (context) => widget);
      },
    );
  }
}

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  late final TextEditingController controller;
  late final FocusNode focusNode;
  late final PageController pageController;

  List imageBottom = [1, 2, 3, 4];
  int activeIndex = 0;
  @override
  void initState() {
    controller = TextEditingController();
    pageController = PageController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSearchBar(
      searchEditingController: controller,
      focusNode: focusNode,
      onCartTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CartPage(),
        ),
      ),
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).unfocus(),
        },
        child: ListView(
          children: [
            const BannerHome(),
            SizedBox(
              height: 16.h,
            ),
            const OrderHistory(),
            const SuggestWidget(),
            const FeaturedWidget(),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 200.h,
              child: PageView.builder(
                controller: pageController,
                // itemCount: pages.length,
                itemCount: imageBottom.length,
                itemBuilder: (_, index) {
                  return Container(
                    alignment: Alignment.center,
                    width: AppSizes.currentScreenWidth,
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage(
                          Assets.images.banner1.path,
                        ),
                        opacity: 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Keep it cozy',
                            style: AppTextStyle.barlow()
                                .copyWith(color: Colors.white, fontSize: 32.sp, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Super soft, super chic—from cardigans to statement knits.',
                            style: AppTextStyle.barlow().copyWith(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                            width: 126.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: AppColors.primary300,
                              borderRadius: BorderRadius.all(Radius.circular(4.sp)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'BUY NOW',
                              style: AppTextStyle.barlow().copyWith(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Align(
              child: SmoothPageIndicator(
                count: imageBottom.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 4,
                  dotWidth: 4,
                  spacing: 4,
                ),
                controller: pageController,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderHistory extends StatelessWidget {
  const OrderHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 44.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: AppSizes.h11.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Lang.current.orderHistory,
                  style: AppTextStyle.barlow(),
                ),
                InkWellWithFeedback(
                  onTap: () => {
                    debugPrint('TAP Lang.current.viewAll >>>>>'),
                  },
                  childColor: AppColors.black,
                  child: Text(
                    Lang.current.viewAll,
                    style: AppTextStyle.secondaryText14Regular().copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          height: 160.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 160.h,
                width: 160.w,
                color: Colors.white,
                padding: EdgeInsets.all(12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID: #9888888',
                      style: AppTextStyle.smallText12Medium().copyWith(color: AppColors.black),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Total: 30.00',
                      style: AppTextStyle.secondaryText14Medium().copyWith(color: AppColors.black),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 28.h,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: AppColors.sematicBlueLight,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
                      ),
                      child: Text(
                        Lang.current.awaitingPayment,
                        style: AppTextStyle.smallText12Medium().copyWith(color: AppColors.sematicInfor),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Flexible(
                      child: Text(
                        '${Lang.current.ordered}: 16, Oct/2023',
                        style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.neutral600),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 32.h,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: AppColors.primary300,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                      ),
                      child: Text(
                        Lang.current.payNow,
                        style: AppTextStyle.secondaryText14Regular().copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              OrderHistoryCard(
                height: 160.h,
                width: 105.w,
                assetName: Assets.images.imageProduct2.path,
                description:
                    'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
              ),
              SizedBox(
                width: 4.w,
              ),
              OrderHistoryCard(
                height: 160.h,
                width: 105.w,
                assetName: Assets.images.imageProduct1.path,
                description:
                    'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
              ),
              SizedBox(
                width: 4.w,
              ),
              OrderHistoryCard(
                height: 160.h,
                width: 105.w,
                assetName: Assets.images.imageProduct2.path,
                description:
                    'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
              ),
              SizedBox(
                width: 4.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SuggestWidget extends StatelessWidget {
  const SuggestWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: 44.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: AppSizes.h11.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Lang.current.suggestForYou,
                  style: AppTextStyle.barlow(),
                ),
                InkWellWithFeedback(
                  onTap: () => {
                    debugPrint('TAP Lang.current.viewAll >>>>>'),
                  },
                  childColor: AppColors.black,
                  child: Text(
                    Lang.current.viewAll,
                    style: AppTextStyle.secondaryText14Regular().copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: MajorCraftData.listProduct.length,
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
              description: MajorCraftData.listProduct[index].description,
              imageName: MajorCraftData.listProduct[index].imageName,
              categoryItem: MajorCraftData.listProduct[index].categoryItem,
              price: MajorCraftData.listProduct[index].price,
              discount: MajorCraftData.listProduct[index].discount,
              quantityBought: MajorCraftData.listProduct[index].quantityBought,
              onTap: () => context.router.push(
                ProductDetailRoute(
                  description: MajorCraftData.listProduct[index].description,
                  imageName: MajorCraftData.listProduct[index].imageName,
                  categoryItem: MajorCraftData.listProduct[index].categoryItem,
                  price: MajorCraftData.listProduct[index].price,
                  discount: MajorCraftData.listProduct[index].discount,
                  quantityBought: MajorCraftData.listProduct[index].quantityBought,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 303.h + 44.h,
      child: Column(
        children: [
          SizedBox(
            height: AppSizes.h16.h,
          ),
          SizedBox(
            height: 44.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: AppSizes.h11.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Lang.current.featuredItems,
                    style: AppTextStyle.barlow(),
                  ),
                  InkWellWithFeedback(
                    onTap: () => {
                      debugPrint('TAP Lang.current.viewAll >>>>>'),
                    },
                    childColor: AppColors.black,
                    child: Text(
                      Lang.current.viewAll,
                      style: AppTextStyle.secondaryText14Regular().copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              itemCount: MajorCraftData.cards.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => {
                    debugPrint(' TAPPP PRODUCTTT >>>>> $index'),
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: CardWidget(
                      flexImage: 150,
                      height: 303.h,
                      width: 150.w,
                      description: MajorCraftData.cards[index].description,
                      imageName: MajorCraftData.cards[index].imageName,
                      categoryItem: MajorCraftData.cards[index].categoryItem,
                      price: MajorCraftData.cards[index].price,
                      discount: MajorCraftData.cards[index].discount,
                      quantityBought: MajorCraftData.cards[index].quantityBought,
                      onTap: () => context.router.push(
                        ProductDetailRoute(
                          description: MajorCraftData.listProduct[index].description,
                          imageName: MajorCraftData.listProduct[index].imageName,
                          categoryItem: MajorCraftData.listProduct[index].categoryItem,
                          price: MajorCraftData.listProduct[index].price,
                          discount: MajorCraftData.listProduct[index].discount,
                          quantityBought: MajorCraftData.listProduct[index].quantityBought,
                        ),
                      ),
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

class BannerHome extends StatelessWidget {
  const BannerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: AppSizes.currentScreenWidth,
          height: 130.h,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(
                Assets.images.banner1.path,
              ),
              opacity: 0.4,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New in Major Craft',
                style: AppTextStyle.smallText12Medium().copyWith(color: Colors.white),
              ),
              Text(
                'SPECIAL PROMOTION',
                style:
                    AppTextStyle.barlow().copyWith(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Expanded(
              flex: 210,
              child: Container(
                height: 70.h,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Image.asset(
                  Assets.images.banner2.path,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              flex: 161,
              child: Container(
                height: 70.h,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Image.asset(
                  Assets.images.banner3.path,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
