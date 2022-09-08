import 'dart:math';
import 'package:flutter/material.dart';
import 'package:grift_shop/data/constants/app_colors.dart';
import 'package:grift_shop/data/constants/app_strings.dart';
import 'package:grift_shop/data/constants/app_text_styles.dart';
import 'package:grift_shop/routes/route_arguments.dart';
import 'package:grift_shop/routes/routes.dart';
import 'package:grift_shop/utils/utils.dart';
import 'package:grift_shop/views/common/common.dart';
import 'package:iconly/iconly.dart';

class SwipeButton extends StatefulWidget {
  const SwipeButton({Key? key}) : super(key: key);

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      height: 72.h,
      borderRadius: 36.r,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              AppStrings.swipeToPay,
              style: AppTextStyles.text16w400Black,
            ),
          ),
          Positioned(
            left: _left,
            bottom: 0,
            top: 0,
            child: GestureDetector(
              onPanUpdate: (d) {
                if (_left < ScreenUtil.instance.width * 0.6) {
                  _left = max(0, _left + d.delta.dx);
                } else {
                  //Navigate
                  AppEnvironment.navigator.pushNamed(
                    SplashRoute.success,
                    arguments: SuccessSplashViewArgs(
                      route: HomeRoute.homeScreen,
                    ),
                  );
                }
                setState(() {});
              },
              onPanEnd: (d) {
                if (_left < ScreenUtil.instance.width * 0.6) {
                  _left = 0;
                  setState(() {});
                }
              },
              child: RoundedBox(
                width: 56.r,
                paddingDisable: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Container(
                    color: AppColors.credWhite,
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: const Icon(IconlyLight.arrow_right_2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
