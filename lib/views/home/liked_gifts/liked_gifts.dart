import 'package:flutter/material.dart';
import 'package:grift_shop/data/constants/constants.dart';
import 'package:grift_shop/utils/utils.dart';
import 'package:grift_shop/views/common/common.dart';
import 'package:grift_shop/views/home/widgets/gift_item.dart';

class LikedGifts extends StatefulWidget {
  const LikedGifts({Key? key}) : super(key: key);

  @override
  State<LikedGifts> createState() => _LikedGiftsState();
}

class _LikedGiftsState extends State<LikedGifts> {
  final lovedData = [
    [AppAssets.sandalsOne, 'Gucci', 6900],
    [AppAssets.wristBandThree, 'Michael Kors', 3500],
    [AppAssets.sandalsTwo, 'Jimmy Choo', 480],
    [AppAssets.sandalsThree, 'Stuart Weitzman', 290],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            sizedBoxWithHeight(32),
            Text(
              AppStrings.lovedGifts,
              style: AppTextStyles.text32w500Black,
            ),
            sizedBoxWithHeight(8),
            Text(
              AppStrings.yourLovedOne,
              style: AppTextStyles.text16w400Black,
            ),
            sizedBoxWithHeight(16),
            Divider(
              color: AppColors.darkBackground,
            ),
            sizedBoxWithHeight(24),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GiftItem(
                assetImage: lovedData[index][0] as String,
                name: lovedData[index][1] as String,
                price: (lovedData[index][2] as num).formatCurrency(),
                liked: true,
                likeFeedback: (v) {
                  lovedData.removeAt(index);
                  setState(() {});
                },
                maxWidth: true,
              ),
              separatorBuilder: (_, __) => sizedBoxWithHeight(24),
              itemCount: lovedData.length,
            ),
            sizedBoxWithHeight(56),
          ],
        ),
      ),
    );
  }
}
