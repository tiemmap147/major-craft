import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:major_craft_application/core/constants/widget_keys.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/core/widgets/shared/custom_divinder.dart';
import 'package:major_craft_application/core/widgets/shared/ink_well_with_feedback.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common.dart';
import 'package:major_craft_application/features/home/data/models/card_model.dart';
import 'package:major_craft_application/major_craft_data.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final ScrollController scrollController;
  List<CardModel> list = MajorCraftData.listProduct;
  int count = 0;
  // late JustTheController toolTipController;
  @override
  void initState() {
    super.initState();
    // toolTipController = JustTheController();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCommon(
      key: WidgetKeys.cartNavigatorKey,
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 40.h,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 16.h),
                  title: InkWellWithFeedback(
                    onTap: () => scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                    ),
                    child: Text(
                      '${Lang.current.myCart} (${list.length})',
                      style: AppTextStyle.primaryText16Medium(),
                    ),
                  ),
                  background: Container(color: AppColors.primary500), // background color
                ),
                automaticallyImplyLeading: false,
                toolbarHeight: 56.h,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  list
                      .map(
                        (product) => Container(
                          margin: EdgeInsets.only(top: 12.h),
                          decoration: const BoxDecoration(color: AppColors.white),
                          child: Column(
                            children: [
                              JustTheTooltip(
                                margin: EdgeInsets.only(
                                  left: (AppSizes.currentScreenWidth / 2) + (183.w - (AppSizes.currentScreenWidth / 2)),
                                ),
                                triggerMode: TooltipTriggerMode.tap,
                                tailBuilder: defaultTailBuilder,
                                enableFeedback: true,
                                borderRadius: BorderRadius.circular(4.r),
                                curve: Curves.fastOutSlowIn,
                                content: Container(
                                  padding: EdgeInsets.all(
                                    8.w,
                                  ),
                                  width: AppSizes.currentScreenWidth * (183 / AppSizes.designScreenWidth),
                                  child: Text(
                                    'This order will be cancelled after 120 minutes if you do not checkout now!',
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.white),
                                  ),
                                ),
                                backgroundColor: AppColors.black,
                                tailBaseWidth: 12.w,
                                tailLength: 6.h,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                                  color: AppColors.sematicOrangeLight,
                                  height: 32.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Assets.icons.cartBell.path,
                                            height: 16.h,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Text(
                                            '29 : 43',
                                            style: AppTextStyle.primaryText16Semibold(),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            'minutes left',
                                            style: AppTextStyle.smallText12Regular()
                                                .copyWith(color: AppColors.sematicWarning),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                        Assets.icons.cartInfor.path,
                                        height: 16.h,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                height: 102.h,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 80.w,
                                      height: 80.h,
                                      child: Image.asset(
                                        product.imageName,
                                        // Assets.images.imageProduct1.path,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              product.description,
                                              style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.black),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Flexible(
                                            child: Text(
                                              product.categoryItem,
                                              style: AppTextStyle.smallText12Regular().copyWith(
                                                color: AppColors.neutral600,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${NumberFormat().format((product.price * (100 - product.discount) / 100).floor())} ₫',
                                                style:
                                                    AppTextStyle.smallText12Medium().copyWith(color: AppColors.black),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                '${NumberFormat().format(product.price)} ₫',
                                                style: AppTextStyle.smallText12Medium().copyWith(
                                                  color: AppColors.neutral500,
                                                  decoration: TextDecoration.lineThrough,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 28.h,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                                decoration: BoxDecoration(
                                                  border: const Border.fromBorderSide(
                                                    BorderSide(color: AppColors.neutral300),
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    InkWell(
                                                      onTap: () => {
                                                        if (count > 1)
                                                          {
                                                            count--,
                                                            setState(() {}),
                                                          },
                                                      },
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        child: SvgPicture.asset(
                                                          Assets.icons.productDetailMinus.path,
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                      ),
                                                    ),
                                                    const VerticalDivider(
                                                      thickness: 1,
                                                      color: AppColors.neutral300,
                                                    ),
                                                    Container(
                                                      width: 44.w,
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        count.toString(),
                                                        textAlign: TextAlign.center,
                                                        style: AppTextStyle.secondaryText14Regular()
                                                            .copyWith(color: AppColors.black),
                                                      ),
                                                    ),
                                                    const VerticalDivider(
                                                      thickness: 1,
                                                      color: AppColors.neutral300,
                                                    ),
                                                    InkWell(
                                                      onTap: () => {
                                                        count++,
                                                        setState(() {}),
                                                      },
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        child: SvgPicture.asset(
                                                          Assets.icons.productDetailPlus.path,
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                '10 items left',
                                                style: AppTextStyle.smallText12Regular().copyWith(
                                                  color: AppColors.neutral600,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12.h),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 163.h, // Adjust the height as necessary for bottom spacing
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: AppSizes.currentScreenWidth,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${Lang.current.subtotal} (3)',
                            style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.black),
                          ),
                          Text(
                            '960.000 ₫',
                            style: AppTextStyle.secondaryText14Semibold().copyWith(color: AppColors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Lang.current.discount,
                            style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.sematicSuccess),
                          ),
                          Text(
                            ' -₫',
                            style: AppTextStyle.secondaryText14Semibold().copyWith(color: AppColors.sematicSuccess),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      const CustomDivider(),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Lang.current.total,
                            style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.black),
                          ),
                          Text(
                            '960.000 ₫',
                            style: AppTextStyle.secondaryText14Semibold().copyWith(color: AppColors.secondary),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 40.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => {
                              showModalBottomSheet(
                                barrierColor: const Color(0xFF000000).withOpacity(0.5),
                                isScrollControlled: true,
                                useRootNavigator: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    // margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                    constraints: BoxConstraints(minWidth: AppSizes.currentScreenWidth),
                                    padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                    ),
                                    child: StatefulBuilder(
                                      builder: (context, st) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${Lang.current.subtotal} (3)',
                                                        style: AppTextStyle.secondaryText14Regular()
                                                            .copyWith(color: AppColors.black),
                                                      ),
                                                      Text(
                                                        '960.000 ₫',
                                                        style: AppTextStyle.secondaryText14Semibold()
                                                            .copyWith(color: AppColors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${Lang.current.myPoint}: ',
                                                        style: AppTextStyle.secondaryText14Regular()
                                                            .copyWith(color: AppColors.secondary),
                                                      ),
                                                      Text(
                                                        '20.000',
                                                        style: AppTextStyle.secondaryText14Semibold()
                                                            .copyWith(color: AppColors.secondary),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  SizedBox(
                                                    height: 40.h,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            clipBehavior: Clip.antiAlias,
                                                            decoration: const ShapeDecoration(
                                                              shape: RoundedRectangleBorder(
                                                                side: BorderSide(color: Color(0xFFDDDEE1)),
                                                                borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(4),
                                                                  bottomLeft: Radius.circular(4),
                                                                ),
                                                              ),
                                                            ),
                                                            alignment: Alignment.centerLeft,
                                                            child: TextFormField(
                                                              textAlignVertical: TextAlignVertical.top,
                                                              // onSubmitted: (value) => {
                                                              //   widget.onTextFieldSubmit!(value),
                                                              // },
                                                              // onChanged: (value) => {
                                                              //   widget.onTextFieldChange!(value),
                                                              // },
                                                              // controller: widget.textEditingController,
                                                              // onFieldSubmitted: (value) => {
                                                              //   widget.onTextFieldSubmit!(value),
                                                              // },
                                                              decoration: InputDecoration(
                                                                isCollapsed: true,
                                                                fillColor: Colors.white,
                                                                contentPadding: EdgeInsets.only(
                                                                  left: 12.w,
                                                                ),
                                                                border: InputBorder.none,
                                                                hintText: Lang.current.pointYouWantToChange,
                                                                hintStyle: AppTextStyle.secondaryText14Regular()
                                                                    .copyWith(color: AppColors.neutral500),
                                                              ),
                                                              style: AppTextStyle.secondaryText14Regular(),
                                                              focusNode: FocusNode(),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 61.w,
                                                          alignment: Alignment.center,
                                                          decoration: const ShapeDecoration(
                                                            color: AppColors.black,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                topRight: Radius.circular(4),
                                                                bottomRight: Radius.circular(4),
                                                              ),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            Lang.current.enter,
                                                            textAlign: TextAlign.center,
                                                            style: AppTextStyle.secondaryText14Medium()
                                                                .copyWith(color: AppColors.white),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        Lang.current.pointDiscount,
                                                        style: AppTextStyle.secondaryText14Regular()
                                                            .copyWith(color: AppColors.sematicSuccess),
                                                      ),
                                                      Text(
                                                        ' -₫',
                                                        style: AppTextStyle.secondaryText14Semibold()
                                                            .copyWith(color: AppColors.sematicSuccess),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        Lang.current.total,
                                                        style: AppTextStyle.secondaryText14Regular()
                                                            .copyWith(color: AppColors.black),
                                                      ),
                                                      Text(
                                                        '960.000 ₫',
                                                        style: AppTextStyle.secondaryText14Semibold()
                                                            .copyWith(color: AppColors.secondary),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 12.h),
                                                  const Divider(
                                                    thickness: 1,
                                                    color: AppColors.neutral300,
                                                  ),
                                                  SizedBox(height: 12.h),
                                                  Text(
                                                    Lang.current.exchangeGuide,
                                                    style: AppTextStyle.secondaryText14Medium()
                                                        .copyWith(color: AppColors.black),
                                                  ),
                                                  Text(
                                                    '''- Lorem ipsum dolor sit amet consectetur. Nulla lacus volutpat amet nibh phasellus.- Quam ultricies morbi in interdum. - Aliquet pellentesque at et integer leo ipsum.- Felis sem nibh duis viverra ultrices urna vitae.- Neque amet gravida viverra eleifend auctor vehicula ut et. - Pretium amet turpis viverra turpis est sed semper egestas. In suscipit aliquet pretium vel lacinia habitant.- Egestas eu auctor dictumst amet. Dolor risus tell''',
                                                    style: AppTextStyle.secondaryText14Regular()
                                                        .copyWith(color: AppColors.neutral700),
                                                  ),
                                                  SizedBox(height: 40.h),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: AppSizes.currentScreenWidth,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x0A000000),
                                                    blurRadius: 10,
                                                    offset: Offset(0, -4),
                                                  ),
                                                ],
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      margin: EdgeInsets.only(top: 12.h),
                                                      height: 40.h,
                                                      decoration: const BoxDecoration(
                                                        color: AppColors.white,
                                                        borderRadius: BorderRadius.all(Radius.circular(4)),
                                                        border:
                                                            Border.fromBorderSide(BorderSide(color: AppColors.black)),
                                                      ),
                                                      child: Text(
                                                        Lang.current.cancel,
                                                        style: AppTextStyle.secondaryText14Medium()
                                                            .copyWith(color: AppColors.black),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 8.w),
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(top: 12.h),
                                                      height: 40.h,
                                                      decoration: const BoxDecoration(
                                                        color: AppColors.primary300,
                                                        borderRadius: BorderRadius.all(Radius.circular(4)),
                                                      ),
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        Lang.current.confirm,
                                                        style: AppTextStyle.secondaryText14Medium()
                                                            .copyWith(color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: AppColors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              child: Text(
                                Lang.current.getDiscount,
                                style: AppTextStyle.secondaryText14Medium().copyWith(color: AppColors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Container(
                            decoration: ShapeDecoration(
                              color: AppColors.primary200,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.r))),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              Lang.current.checkoutNow,
                              style: AppTextStyle.secondaryText14Medium().copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ],
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

  Path defaultTailBuilder(Offset point1, Offset point2, Offset point3) {
    final path = Path()
      ..moveTo(AppSizes.currentScreenWidth - 24.w - 12.w - 5.w, point1.dy)
      ..lineTo(AppSizes.currentScreenWidth - 24.w - 12.w - 10.w, point2.dy)
      ..lineTo(AppSizes.currentScreenWidth - 24.w - 12.w, point3.dy)
      ..close();

    return path;
  }
}
