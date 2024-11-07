import 'package:major_craft_application/features/account/presentation/models/account_item_model.dart';
import 'package:major_craft_application/resources/assets.gen.dart';

final List<AccountItem> accountItems = [
  AccountItem(iconPath: Assets.icons.accountListUser.path, label: 'My Address'),
  AccountItem(iconPath: Assets.icons.accountCart.path, label: 'My Orders'),
  AccountItem(iconPath: Assets.icons.accountMail.path, label: 'Change Email'),
  AccountItem(iconPath: Assets.icons.accountPassword.path, label: 'Change Password'),
  AccountItem(iconPath: Assets.icons.accountGlobal.path, label: 'Language '),
  AccountItem(iconPath: Assets.icons.accountTrash.path, label: 'Delete Account'),
];
