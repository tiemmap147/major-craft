import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/resources/assets.gen.dart';
import 'package:major_craft_application/theme/theme.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({
    super.key,
  });

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary500,
        title: const Text('Flutter'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100.h),
            Image.asset(
              Assets.images.mioLogoImage.path,
              width: MediaQuery.of(context).size.width / 2,
            ),
            SizedBox(height: 10.h),
            Text(
              '${Lang.current.welcome} Mio',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
