import 'package:fluttertoast/fluttertoast.dart';
import 'package:major_craft_application/theme/app_colors.dart';

abstract class ToastUtils {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.neutral700,
      textColor: AppColors.black,
      fontSize: 16,
    );
  }
}
