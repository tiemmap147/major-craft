import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common_search_bar.dart';
import 'package:major_craft_application/dependency_injection.dart';
import 'package:major_craft_application/features/home/presentation/widgets/card_item.dart';
import 'package:major_craft_application/features/product_detail/presentation/bloc/product_detail_bloc.dart';
import 'package:major_craft_application/features/product_detail/presentation/widgets/product_detail_hot_deals.dart';
import 'package:major_craft_application/major_craft_data.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    Key? key,
    required this.description,
    required this.imageName,
    required this.categoryItem,
    required this.price,
    required this.discount,
    required this.quantityBought,
  }) : super(key: key);
  final String description;
  final String imageName;
  final String categoryItem;
  final int price;
  final int discount;
  final int quantityBought;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
      create: (context) => DependencyInjection.instance(),
      child: ProductDetailWrapper(
        description: description,
        imageName: imageName,
        categoryItem: categoryItem,
        price: price,
        discount: discount,
        quantityBought: quantityBought,
      ),
    );
  }
}

class ProductDetailWrapper extends StatefulWidget {
  const ProductDetailWrapper({
    Key? key,
    required this.description,
    required this.imageName,
    required this.categoryItem,
    required this.price,
    required this.discount,
    required this.quantityBought,
  }) : super(key: key);
  final String description;
  final String imageName;
  final String categoryItem;
  final int price;
  final int discount;
  final int quantityBought;

  @override
  State<ProductDetailWrapper> createState() => _ProductDetailWrapperState();
}

class _ProductDetailWrapperState extends State<ProductDetailWrapper> {
  final double heightDescriptionDesign = 228.h;
  final String htmlcontent = '''
    <img src="https://vrsofttech.com/flutter-tutorials/images/vr.png" width="100">
    <img src="https://vrsofttech.com/flutter-tutorials/images/vr.png" width="100">
    <img src="https://vrsofttech.com/flutter-tutorials/images/vr.png" width="100">
    <img src="https://vrsofttech.com/flutter-tutorials/images/vr.png" width="100">
    <img src="https://vrsofttech.com/flutter-tutorials/images/vr.png" width="100">
    <img src="https://vrsofttech.com/flutter-tutorials/images/vr.png" width="100">
    <img src="https://vrsofttech.com/flutter-tutorials/images/vr.png" width="100">
  ''';

  final ScrollController htmlScrollController = ScrollController();

  late final TextEditingController controller;
  late final FocusNode focusNode;
  late final PageController pageController;
  late final ScrollController scrollController;

  double heightDescription = 0;
  double heightDescriptionLimit = double.infinity;
  bool elementsExceedHeight = false;
  GlobalKey keyDescription = GlobalKey();
  List imageBottom = [1, 2, 3, 4];
  int activeIndex = 0;

  bool isSeeMore = false;

  @override
  void initState() {
    controller = TextEditingController();
    pageController = PageController();
    focusNode = FocusNode();
    scrollController = ScrollController();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   checkElementsHeight();
    // });
    super.initState();

    // After the frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Check if the content of the Html widget is scrollable
      if (htmlScrollController.hasClients && htmlScrollController.position.maxScrollExtent > 0) {
        print('The content is more than 160 in height.');
        setState(() {
          isSeeMore = false;
        });
      } else {
        print('The content fits within the height of 160.');
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSearchBar(
      searchEditingController: controller,
      focusNode: focusNode,
      searchBarType: SearchBarType.productDetail.index,
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).unfocus(),
        },
        child: Container(
          color: AppColors.neutral100,
          child: ListView(
            children: [
              SizedBox(
                height: 375.h,
                child: Image.asset(
                  Assets.images.imageProduct1.path,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 12.w),
                height: 110.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '4 ${Lang.current.typesOfItem}',
                      style: AppTextStyle.smallText12Regular(),
                    ),
                    SizedBox(
                      height: 60.h,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60.h,
                            width: 60.w,
                            margin: EdgeInsets.only(right: 4.w),
                            child: Image.asset(
                              Assets.images.imageProduct1.path,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.description,
                      style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          '${NumberFormat().format(widget.price)} ₫',
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
                            '-${widget.discount.toString()}%',
                            style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.secondary),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${NumberFormat().format((widget.price * (100 - widget.discount) / 100).floor())} ₫',
                      style: AppTextStyle.secondaryText14Semibold().copyWith(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      '${widget.quantityBought}+ ${Lang.current.bought}',
                      style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.neutral600),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              const ProductDetailHotDeals(),
              SizedBox(
                height: 8.h,
              ),
              Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      height: isSeeMore ? null : 160.h,
                      child: SingleChildScrollView(
                        controller: htmlScrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Html(
                                  key: keyDescription,
                                  data: htmlcontent,
                                  shrinkWrap: true,
                                ),
                                if (isSeeMore)
                                  SizedBox(
                                    height: 56.h,
                                  )
                                else
                                  const SizedBox(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 160.h,
                        width: AppSizes.currentScreenWidth,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                            begin: FractionalOffset.bottomCenter,
                            end: FractionalOffset.topCenter,
                            colors: [
                              Colors.white.withOpacity(1),
                              Colors.white.withOpacity(1),
                              Colors.white.withOpacity(0.9),
                              Colors.white.withOpacity(0),
                              Colors.white.withOpacity(0),
                            ],
                            stops: const [
                              0.0,
                              0.25,
                              0.35,
                              0.45,
                              1.0,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12.h,
                      child: SizedBox(
                        // padding: EdgeInsets.only(top: isSeeMore ? 22.h : 0),
                        height: 32,
                        width: AppSizes.currentScreenWidth - 24.w,
                        child: InkWell(
                          onTap: () => {
                            setState(() {
                              isSeeMore = !isSeeMore;
                            }),
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isSeeMore ? Lang.current.seeLess : Lang.current.seeMore,
                                style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.primary400),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              SvgPicture.asset(
                                isSeeMore
                                    ? Assets.icons.productDetailSeeLess.path
                                    : Assets.icons.productDetailSeeMore.path,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.w),
              //   color: Colors.white,
              //   constraints: const BoxConstraints(
              //       // maxHeight: heightDescriptionLimit,
              //       // minHeight: heightDescriptionLimit == heightDescription + 68.h ? heightDescriptionLimit : 0,
              //       ),
              //   width: AppSizes.currentScreenWidth,
              //   child: Stack(
              //     children: [
              //       Html(
              //         key: keyDescription,
              //         data: htmlcontent,
              //         shrinkWrap: true,
              //       ),
              //       if (heightDescriptionLimit < heightDescription) ...[
              //         Positioned(
              //           top: 0,
              //           child: Container(
              //             height: heightDescriptionLimit,
              //             width: AppSizes.currentScreenWidth,
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               gradient: LinearGradient(
              //                 begin: FractionalOffset.bottomCenter,
              //                 end: FractionalOffset.topCenter,
              //                 colors: [
              //                   Colors.white.withOpacity(1),
              //                   Colors.white.withOpacity(1),
              //                   Colors.white.withOpacity(0.9),
              //                   Colors.white.withOpacity(0),
              //                   Colors.white.withOpacity(0),
              //                 ],
              //                 stops: const [
              //                   0.0,
              //                   0.25,
              //                   0.35,
              //                   0.45,
              //                   1.0,
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //         Positioned(
              //           bottom: 0,
              //           child: SizedBox(
              //             height: 32,
              //             width: AppSizes.currentScreenWidth - 24.w,
              //             child: InkWell(
              //               onTap: () => {
              //                 setState(() {}),
              //               },
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Text(
              //                     'See more',
              //                     style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.primary400),
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     width: 8.w,
              //                   ),
              //                   SvgPicture.asset(
              //                     Assets.icons.productDetailSeeMore.path,
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //       // if (heightDescriptionLimit == heightDescription + 68.h) ...[
              //       //   Positioned(
              //       //     bottom: 0,
              //       //     child: Container(
              //       //       height: heightDescriptionLimit,
              //       //       width: AppSizes.currentScreenWidth,
              //       //       decoration: const BoxDecoration(),
              //       //       alignment: Alignment.bottomCenter,
              //       //       child: SizedBox(
              //       //         height: 32.h,
              //       //         width: AppSizes.currentScreenWidth - 24.w,
              //       //         child: InkWell(
              //       //           onTap: () => {
              //       //             setState(() {
              //       //               heightDescriptionLimit = heightDescriptionDesign;
              //       //             }),
              //       //           },
              //       //           child: Row(
              //       //             mainAxisAlignment: MainAxisAlignment.center,
              //       //             children: [
              //       //               Text(
              //       //                 'See less',
              //       //                 style: AppTextStyle.primaryText16Semibold().copyWith(color: AppColors.primary400),
              //       //                 overflow: TextOverflow.ellipsis,
              //       //               ),
              //       //               SizedBox(
              //       //                 width: 8.w,
              //       //               ),
              //       //               SvgPicture.asset(
              //       //                 Assets.icons.productDetailSeeLess.path,
              //       //               ),
              //       //             ],
              //       //           ),
              //       //         ),
              //       //       ),
              //       //     ),
              //       //   ),
              //       // ],
              //     ],
              //   ),
              // ),
              const ProductDetailSuggestWidget(),
            ],
          ),
        ),
      ),
    );
  }

  // void checkElementsHeight() {
  //   final RenderBox listViewRenderBox = keyDescription.currentContext!.findRenderObject()! as RenderBox;
  //   heightDescription = listViewRenderBox.size.height;
  //   debugPrint('heightDescription >>> $heightDescription');
  //   if (listViewRenderBox.size.height > heightDescriptionDesign) {
  //     setState(() {
  //       heightDescriptionLimit = heightDescriptionDesign;
  //     });
  //   } else {
  //     heightDescriptionLimit = heightDescription;
  //   }
  // }
}

class ProductDetailSuggestWidget extends StatelessWidget {
  const ProductDetailSuggestWidget({
    super.key,
  });

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
                    Lang.current.suggestForYou,
                    style: AppTextStyle.barlow(),
                  ),
                  Text(
                    Lang.current.viewAll,
                    style: AppTextStyle.secondaryText14Regular().copyWith(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: CardWidget(
                    flexImage: 150,
                    height: 303.h,
                    width: 150.w,
                    description: MajorCraftData.listProduct[index].description,
                    imageName: MajorCraftData.listProduct[index].imageName,
                    categoryItem: MajorCraftData.listProduct[index].categoryItem,
                    price: MajorCraftData.listProduct[index].price,
                    discount: MajorCraftData.listProduct[index].discount,
                    quantityBought: MajorCraftData.listProduct[index].quantityBought,
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

class ExpandableHtml extends StatefulWidget {
  const ExpandableHtml({super.key, required this.htmlContent, required this.isExpanded, required this.onTap});
  final String htmlContent;
  final bool isExpanded;
  final VoidCallback onTap;
  @override
  ExpandableHtmlState createState() => ExpandableHtmlState();
}

class ExpandableHtmlState extends State<ExpandableHtml> {
  @override
  Widget build(BuildContext context) {
    return Html(
      data: widget.htmlContent,
      shrinkWrap: true,
    );
  }
}
