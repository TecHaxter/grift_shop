import 'package:flutter/material.dart';
import 'package:grift_shop/data/constants/app_assets.dart';
import 'package:grift_shop/data/constants/app_strings.dart';
import 'package:grift_shop/data/constants/app_text_styles.dart';
import 'package:grift_shop/utils/utils.dart';
import 'package:grift_shop/views/common/common.dart';
import 'package:grift_shop/views/home/widgets/gift_item.dart';
import 'package:iconly/iconly.dart';

class ExploreGifts extends StatefulWidget {
  const ExploreGifts({Key? key}) : super(key: key);

  @override
  State<ExploreGifts> createState() => _ExploreGiftsState();
}

class _ExploreGiftsState extends State<ExploreGifts> {
  final newArrivalData = [
    [AppAssets.wristWatchTwo, 'Cartier Panther', 2840, false],
    [AppAssets.wristBandOne, 'Seiko', 780, false],
    [AppAssets.wristWatchThree, 'BVLGari Serpenti', 8800, true],
    [AppAssets.wristBandTwo, "Herme's", 9800, false],
    [AppAssets.wristWatchOne, 'Frank Muller', 460, false],
  ];

  final weRecommedData = [
    [AppAssets.sandalsOne, 'Gucci', 6900, false],
    [AppAssets.wristBandThree, 'Michael Kors', 3500, false],
    [AppAssets.sandalsTwo, 'Jimmy Choo', 480, false],
    [AppAssets.sandalsThree, 'Stuart Weitzman', 290, false],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxWithHeight(32),
            Text(
              AppStrings.findGifts,
              style: AppTextStyles.text32w500Black,
            ),
            sizedBoxWithHeight(8),
            Text(
              AppStrings.forYourLovedOne,
              style: AppTextStyles.text16w400Black,
            ),
            sizedBoxWithHeight(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RoundedBox(
                      height: 48.r,
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(IconlyLight.search),
                      ),
                    ),
                  ),
                  sizedBoxWithWidth(16),
                  RoundedBox(
                    height: 48.r,
                    width: 48.r,
                    child: const Icon(IconlyLight.filter),
                  ),
                ],
              ),
            ),
            sizedBoxWithHeight(32),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.newArrivals,
                  style: AppTextStyles.text18w800Black,
                ),
              ),
            ),
            sizedBoxWithHeight(16),
            SizedBox(
              height: 240.w,
              width: double.maxFinite,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 24.w : 0.0,
                      right: index == (newArrivalData.length - 1) ? 24.w : 0.0,
                    ),
                    child: GiftItem(
                      assetImage: newArrivalData[index][0] as String,
                      name: newArrivalData[index][1] as String,
                      price: (newArrivalData[index][2] as num).formatCurrency(),
                      liked: newArrivalData[index][3] as bool,
                      likeFeedback: (val) {
                        newArrivalData[index][3] = val;
                        setState(() {});
                      },
                    ),
                  );
                },
                separatorBuilder: (_, __) => sizedBoxWithWidth(16),
                itemCount: newArrivalData.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            sizedBoxWithHeight(32),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.weRecommend,
                  style: AppTextStyles.text18w800Black,
                ),
              ),
            ),
            sizedBoxWithHeight(16),
            SizedBox(
              height: 240.w,
              width: double.maxFinite,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 24.w : 0.0,
                      right: index == (weRecommedData.length - 1) ? 24.w : 0.0,
                    ),
                    child: GiftItem(
                      assetImage: weRecommedData[index][0] as String,
                      name: weRecommedData[index][1] as String,
                      price: (weRecommedData[index][2] as num).formatCurrency(),
                      liked: weRecommedData[index][3] as bool?,
                      likeFeedback: (val) {
                        weRecommedData[index][3] = val;
                        setState(() {});
                      },
                    ),
                  );
                },
                separatorBuilder: (_, __) => sizedBoxWithWidth(16),
                itemCount: weRecommedData.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            sizedBoxWithHeight(56),
          ],
        ),
      ),
    );
  }
}
