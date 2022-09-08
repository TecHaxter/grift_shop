import 'package:flutter/material.dart';
import 'package:grift_shop/data/constants/constants.dart';
import 'package:grift_shop/routes/routes.dart';
import 'package:grift_shop/utils/utils.dart';
import 'package:grift_shop/views/common/common.dart';
import 'package:lottie/lottie.dart';

class IntroSplash extends StatefulWidget {
  const IntroSplash({Key? key}) : super(key: key);

  @override
  State<IntroSplash> createState() => _IntroSplashState();
}

class _IntroSplashState extends State<IntroSplash>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      AppEnvironment.navigator.pushReplacementNamed(AuthRoute.signIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      backgroundColor: AppColors.credWhite,
      body: Center(
        child: RoundedBox(
          width: 216.w,
          height: 216.w,
          borderWidth: 2.w,
          child: RoundedBox(
            width: 200.w,
            height: 200.w,
            borderWidth: 2.w,
            child: LottieBuilder.asset(
              AppAssets.giftBoxLottie,
            ),
          ),
        ),
      ),
    );
  }
}
