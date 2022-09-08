import 'package:flutter/material.dart';
import 'package:grift_shop/data/constants/constants.dart';
import 'package:grift_shop/routes/routes.dart';
import 'package:grift_shop/utils/screen_config.dart';
import 'package:grift_shop/utils/utils.dart';
import 'package:grift_shop/views/common/common.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                sizedBoxWithHeight(32),
                Text(
                  AppStrings.findTheBestGifts,
                  style: AppTextStyles.text32w500Black,
                ),
                sizedBoxWithHeight(8),
                Text(
                  AppStrings.forYourLovedOne,
                  style: AppTextStyles.text16w400Black,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: ScreenUtil.instance.height * 0.40,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        left: 24.w,
                        right: 24.w,
                        bottom: 32.h,
                        child: RoundedBox(
                          child: RoundedBox(
                            paddingDisable: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: Image.asset(
                                AppAssets.giftBox,
                                height: double.maxFinite,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -8.w,
                        child: Image.asset(
                          AppAssets.leaf,
                          width: 80.w,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
                sizedBoxWithHeight(8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: InkWell(
                    onTap: () {
                      AppEnvironment.navigator
                          .pushReplacementNamed(HomeRoute.homeScreen);
                    },
                    child: RoundedBox(
                      height: 120.h,
                      width: double.maxFinite,
                      // borderRadius: 32.h,
                      child: RoundedBox(
                        paddingDisable: true,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(width: 1.0),
                                            right: BorderSide(width: 0.5),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          AppStrings.watches,
                                          style: AppTextStyles.text16w400Black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(width: 1.0),
                                            left: BorderSide(width: 0.5),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          AppStrings.wristBands,
                                          style: AppTextStyles.text16w400Black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    AppStrings.sandals,
                                    style: AppTextStyles.text16w400Black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: InkWell(
                    onTap: () {
                      AppEnvironment.navigator
                          .pushReplacementNamed(HomeRoute.homeScreen);
                    },
                    child: RoundedBox(
                      width: double.maxFinite,
                      height: 64.h,
                      borderRadius: 32.h,
                      child: Text(
                        AppStrings.signIn,
                        style: AppTextStyles.text18w400Black,
                      ),
                    ),
                  ),
                ),
                sizedBoxWithHeight(32),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
