import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/assets.gen.dart';
import '../../../generated/colors.gen.dart';
import '../../modules/app/app_router.dart';
import '../..//common/extensions/int_duration.dart';
import '../../common/utils/getit_utils.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  SplashPage({super.key}) {
    fetchAll();
  }

  fetchAll() async {
    await Future.delayed(3.seconds);
    getIt<AppRouter>().replaceAll([HomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: Center(
        child: SizedBox(
          width: 150.w,
          child: Assets.appImages.logo.image(
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
