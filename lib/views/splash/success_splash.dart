import 'package:flutter/material.dart';
import 'package:grift_shop/data/constants/constants.dart';
import 'package:grift_shop/routes/route_arguments.dart';
import 'package:grift_shop/routes/routes.dart';
import 'package:grift_shop/utils/utils.dart';
import 'package:lottie/lottie.dart';

class SuccessSplash extends StatefulWidget {
  final SuccessSplashViewArgs args;
  const SuccessSplash({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<SuccessSplash> createState() => _SuccessSplashState();
}

class _SuccessSplashState extends State<SuccessSplash>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      AppEnvironment.navigator.pushReplacementNamed(widget.args.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      backgroundColor: AppColors.credWhite,
      body: Center(
        child: SizedBox(
          width: ScreenUtil.instance.width * 0.5,
          child: LottieBuilder.asset(
            AppAssets.successLottie,
          ),
        ),
      ),
    );
  }
}
