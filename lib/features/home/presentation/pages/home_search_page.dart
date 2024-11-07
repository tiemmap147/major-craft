import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_craft_application/core/enum/app_enum.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/core/widgets/shared/scaffold_common_search_bar.dart';
import 'package:major_craft_application/dependency_injection.dart';
import 'package:major_craft_application/features/home/presentation/bloc/home_bloc.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/service/navigation_service.dart';
import 'package:major_craft_application/theme/app_colors.dart';
import 'package:major_craft_application/theme/app_sizes.dart';
import 'package:major_craft_application/theme/app_text_style.dart';

@RoutePage()
class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({super.key});

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => DependencyInjection.instance(),
      child: const HomeSearchPageWrapper(),
    );
  }
}

class HomeSearchPageWrapper extends StatefulWidget {
  const HomeSearchPageWrapper({
    super.key,
  });

  @override
  State<HomeSearchPageWrapper> createState() => _HomeSearchPageWrapperState();
}

class _HomeSearchPageWrapperState extends State<HomeSearchPageWrapper> {
  late final _debouncer = Debouncer(milliseconds: 1000);
  late HomeBloc _homeBloc;
  late final TextEditingController searchController;
  late final FocusNode focusNode;
  late final List<String> recentSearches = [];
  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of(context);
    // Call get all [recent search] first
    _homeBloc.add(
      const GetRecentSearchEvent(
        keyword: '',
      ),
    );
    focusNode = FocusNode();
    searchController = TextEditingController();
    searchController.addListener(_onTextFiledChange);
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) => {
        // When user submit new value - need to recall GetRecentSearch for update new data
        if (state is AddRecentSearchState)
          {
            _homeBloc.add(const GetRecentSearchEvent(keyword: '')),
          },
        if (state is GetRecentSearchState)
          {
            recentSearches.clear(),
            recentSearches.addAll(state.recentSearches),
          },
      },
      builder: (context, state) {
        if (state is GetRecentSearchState) {
          recentSearches.clear();
          recentSearches.addAll(state.recentSearches);
        }

        return ScaffoldSearchBar(
          focusNode: focusNode,
          searchEditingController: searchController,
          searchBarType: SearchBarType.searchPage.index,
          onTextFieldSubmit: (keyword) => {
            _onTextFieldSubmit(keyword),
          },
          onTextFieldChange: (value) => {
            _onTextFiledChange(),
          },
          body: GestureDetector(
            onTap: () => {
              FocusScope.of(context).unfocus(),
            },
            child: Container(
              color: AppColors.white,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return index == 0
                      ? SizedBox(
                          height: 40.h,
                          child: Row(
                            children: [
                              SizedBox(
                                width: AppSizes.w12.w,
                              ),
                              SvgPicture.asset(Assets.icons.homeSearchHistory.path),
                              SizedBox(
                                width: AppSizes.w4.w,
                              ),
                              Text(
                                Lang.current.recentSearches,
                                style: AppTextStyle.secondaryText14Medium().copyWith(color: AppColors.neutral600),
                              ),
                            ],
                          ),
                        )
                      : InkWell(
                          onTap: () => {
                            debugPrint('TAP SEARCH ITEM >>>>>'),
                            searchController.text = recentSearches[index - 1],
                            context.router.push(HomeSearchResultRoute(searchText: searchController.text)),
                          },
                          child: SizedBox(
                            height: 40.h,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: AppSizes.w12.w,
                                ),
                                Text(
                                  recentSearches[index - 1],
                                  style: AppTextStyle.secondaryText14Medium(),
                                ),
                                const Spacer(),
                                SvgPicture.asset(Assets.icons.homeSearchArrowUp.path),
                                SizedBox(
                                  width: AppSizes.w12.w,
                                ),
                              ],
                            ),
                          ),
                        );
                },
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  width: AppSizes.currentScreenWidth,
                  color: AppColors.neutral300,
                ),
                // itemCount: MajorCraftData.recentSearch.length + 1,
                itemCount: recentSearches.length + 1,
              ),
            ),
          ),
        );
      },
    );
  }

  void _onTextFieldSubmit(
    String keyword,
  ) {
    _homeBloc.add(
      AddRecentSearchEvent(
        keyword: keyword,
      ),
    );
  }

  Future<void> _onTextFiledChange() async {
    _homeBloc.add(ClearAllEvent());
    await Future.delayed(
      const Duration(
        milliseconds: 10,
      ),
    );
    if (searchController.text.isNotEmpty) {
      _debouncer.run(() {
        _homeBloc.add(
          GetRecentSearchEvent(
            keyword: searchController.text,
          ),
        );
      });
    } else {
      _homeBloc.add(
        const GetRecentSearchEvent(
          keyword: '',
        ),
      );
    }
  }
}

class Debouncer {
  Debouncer({required this.milliseconds});
  Timer? _timer;
  final int milliseconds;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
