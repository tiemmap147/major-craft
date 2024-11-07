import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/features/account/presentation/widgets/account_page_component.dart';
import 'package:major_craft_application/features/account/presentation/widgets/account_page_header.dart';
import 'package:major_craft_application/features/account/presentation/widgets/account_page_star.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/service/navigation_service.dart';
import 'package:major_craft_application/theme/theme.dart';

@RoutePage()
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AccountPageHeader(),
        const AccountPageStar(),
        AccountPageComponent(
          onTap: () => {
            context.router.push(const HistoryTransactionRoute()),
          },
          iconPath: Assets.icons.accountReceipt.path,
          label: Lang.current.historyTransaction,
        ),
        SizedBox(height: AppSizes.h8.h),
        AccountPageComponent(
          onTap: () => {
            context.router.push(const MyAddressRoute()),
          },
          iconPath: Assets.icons.accountListUser.path,
          label: Lang.current.myAddress,
        ),
        AccountPageComponent(
          onTap: () {},
          iconPath: Assets.icons.accountCart.path,
          label: Lang.current.myOrders,
        ),
        SizedBox(
          height: AppSizes.h8.h,
        ),
        AccountPageComponent(
          onTap: () {},
          iconPath: Assets.icons.accountMail.path,
          label: Lang.current.changeEmail,
        ),
        AccountPageComponent(
          onTap: () {},
          iconPath: Assets.icons.accountPassword.path,
          label: Lang.current.changePassword,
        ),
        SizedBox(
          height: AppSizes.h8.h,
        ),
        AccountPageComponent(
          onTap: () => context.router.push(AccountLanguageChangeRoute()),
          iconPath: Assets.icons.accountGlobal.path,
          label: Lang.current.language,
          additionIconPath: Assets.icons.accountVietnamFlag.path,
        ),
        AccountPageComponent(
          onTap: () => {
            context.router.push(
              const ShippingRoute(),
            ),
          },
          iconPath: Assets.icons.accountListUser.path,
          label: 'Shipping Test',
        ),
        AccountPageComponent(
          onTap: () {},
          iconPath: Assets.icons.accountTrash.path,
          label: Lang.current.deleteAccount,
          textColor: AppColors.sematicError,
        ),
      ],
    );
  }
}
