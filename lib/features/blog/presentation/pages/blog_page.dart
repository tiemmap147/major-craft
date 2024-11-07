import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common_search_bar.dart';
import 'package:major_craft_application/major_craft_data.dart';
import 'package:major_craft_application/service/navigation_service.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  late final TextEditingController blogSearchController;
  late final FocusNode focusNode;

  @override
  void initState() {
    blogSearchController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    blogSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldSearchBar(
      focusNode: focusNode,
      searchEditingController: blogSearchController,
      searchBarType: SearchBarType.home.index,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(12.h),
            child: Text(
              Lang.current.allBlogPosts,
              style: AppTextStyle.primaryText16Semibold().copyWith(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: MajorCraftData.listBlog.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => {
                    context.router.push(BlogDetailRoute()),
                  },
                  child: Container(
                    height: 88.h,
                    color: Colors.white,
                    width: AppSizes.currentScreenWidth,
                    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(right: 12.w),
                          width: 108.w,
                          height: 80.h,
                          child: Image.asset(
                            MajorCraftData.listBlog[index].imageSrc,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                height: 8.h,
              ),
            ),
          ),

          // Container(
          //   height: AppSizes.currentScreenHeight,
          //   width: AppSizes.currentScreenWidth,
          //   color: Colors.amber,
          //   child: SvgPicture.asset(Assets.icons.accountMail.path),
          // ),
          // Image.asset(Assets.images.banner3.path),
        ],
      ),
    );
  }
}
