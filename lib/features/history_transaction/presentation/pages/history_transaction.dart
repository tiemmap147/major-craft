import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/dependency_injection.dart';
import 'package:major_craft_application/features/history_transaction/presentation/bloc/history_transaction_bloc.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class HistoryTransactionPage extends StatelessWidget {
  const HistoryTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryTransactionBloc>(
      create: (context) => DependencyInjection.instance(),
      child: const HistoryTransactionWrapper(),
    );
  }
}

class HistoryTransactionWrapper extends StatefulWidget {
  const HistoryTransactionWrapper({super.key});

  @override
  State<HistoryTransactionWrapper> createState() => _HistoryTransactionWrapperState();
}

class _HistoryTransactionWrapperState extends State<HistoryTransactionWrapper> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).unfocus(),
        },
        child: SizedBox(
          height: AppSizes.currentScreenHeight,
          child: Column(
            children: [
              Container(
                color: AppColors.primary500,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  width: AppSizes.currentScreenWidth,
                  color: AppColors.primary500,
                  child: SizedBox(
                    height: 40.h,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () => {
                            context.router.pop(),
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'History Transaction',
                            style: AppTextStyle.primaryText16Medium(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                height: 37.h,
                width: double.infinity,
                color: AppColors.sematicGreenLight,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'You have ',
                        style: AppTextStyle.secondaryText14Semibold().copyWith(color: Colors.black),
                      ),
                      TextSpan(
                        text: '100 points.',
                        style: AppTextStyle.secondaryText14Semibold().copyWith(color: AppColors.sematicSuccess),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: 49.h,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  controller: tabController,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: true,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(color: AppColors.primary400, width: 2),
                  ),
                  onTap: (value) => {
                    FocusScope.of(context).unfocus(),
                    setState(() {}),
                  },
                  tabs: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 12.h, right: 12.w, left: 12.w),
                      child: Center(
                        child: Text(
                          'All history',
                          style: AppTextStyle.secondaryText14Medium()
                              .copyWith(color: tabController.index == 0 ? AppColors.primary400 : AppColors.neutral600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 12.h, right: 12.w, left: 12.w),
                      child: Center(
                        child: Text(
                          'Recieved',
                          style: AppTextStyle.secondaryText14Medium()
                              .copyWith(color: tabController.index == 1 ? AppColors.primary400 : AppColors.neutral600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 12.h, right: 12.w, left: 12.w),
                      child: Center(
                        child: Text(
                          'Used',
                          style: AppTextStyle.secondaryText14Medium()
                              .copyWith(color: tabController.index == 2 ? AppColors.primary400 : AppColors.neutral600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    //All history
                    SingleChildScrollView(
                      child: Container(
                        constraints: BoxConstraints(minHeight: 41.h),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Recieved ',
                                    style: AppTextStyle.secondaryText14Regular().copyWith(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: '100 points ',
                                    style: AppTextStyle.secondaryText14Semibold()
                                        .copyWith(color: AppColors.sematicSuccess),
                                  ),
                                  TextSpan(
                                    text: 'from order #ID IJWTBWYF',
                                    style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '09:00 - 20, Oct 2023',
                              style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.neutral500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Divider(
                              color: AppColors.neutral300,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Recieved
                    SingleChildScrollView(
                      child: Container(
                        constraints: BoxConstraints(minHeight: 41.h),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Recieved ',
                                    style: AppTextStyle.secondaryText14Regular().copyWith(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: '100 points ',
                                    style: AppTextStyle.secondaryText14Semibold()
                                        .copyWith(color: AppColors.sematicSuccess),
                                  ),
                                  TextSpan(
                                    text: 'from order #ID IJWTBWYF',
                                    style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '09:00 - 20, Oct 2023',
                              style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.neutral500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Divider(
                              color: AppColors.neutral300,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Used
                    SingleChildScrollView(
                      child: Container(
                        constraints: BoxConstraints(minHeight: 41.h),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Recieved ',
                                    style: AppTextStyle.secondaryText14Regular().copyWith(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: '100 points ',
                                    style: AppTextStyle.secondaryText14Semibold()
                                        .copyWith(color: AppColors.sematicSuccess),
                                  ),
                                  TextSpan(
                                    text: 'from order #ID IJWTBWYF',
                                    style: AppTextStyle.secondaryText14Regular().copyWith(color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '09:00 - 20, Oct 2023',
                              style: AppTextStyle.smallText12Regular().copyWith(color: AppColors.neutral500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Divider(
                              color: AppColors.neutral300,
                              height: 1,
                            ),
                          ],
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
    );
  }
}
