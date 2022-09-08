import 'package:flutter/material.dart';
import 'package:grift_shop/data/constants/constants.dart';
import 'package:grift_shop/utils/utils.dart';
import 'package:grift_shop/views/common/common.dart';
import 'package:grift_shop/views/my_bag/widgets/bag_item.dart';
import 'package:grift_shop/views/my_bag/widgets/widgets.dart';
import 'package:iconly/iconly.dart';

class MyBag extends StatefulWidget {
  const MyBag({Key? key}) : super(key: key);

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  final List<List<dynamic>> itemsData = [
    [AppAssets.sandalsOne, 'Gucci', 6900, 1],
    [AppAssets.wristWatchTwo, 'Cartier Panther', 2840, 1],
    [AppAssets.wristBandOne, 'Seiko', 3400, 2],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              sizedBoxWithHeight(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      AppEnvironment.navigator.pop();
                    },
                    child: Icon(
                      IconlyBroken.arrow_left,
                      size: 32.sp,
                    ),
                  ),
                  Text(
                    AppStrings.myBag,
                    style: AppTextStyles.text32w500Black,
                  ),
                  Opacity(
                    opacity: 0,
                    child: Icon(
                      IconlyBroken.arrow_left,
                      size: 32.sp,
                    ),
                  )
                ],
              ),
              sizedBoxWithHeight(8),
              Text(
                AppStrings.totalItems(itemsData.length),
                style: AppTextStyles.text16w400Black,
              ),
              sizedBoxWithHeight(16),
              Divider(
                color: AppColors.darkBackground,
              ),
              sizedBoxWithHeight(16),
              ...itemsData.mapIndexed(
                (index, List item) => BagItem(
                  assetPath: item[0],
                  name: item[1],
                  price: ((item[2]) as num).formatCurrency(),
                  quantity: '${item[3]}',
                  incrementQuantity: (isQuantityIncrement) {
                    if (isQuantityIncrement) {
                      itemsData[index][3] += 1;
                    } else {
                      itemsData[index][3] -= 1;
                    }
                    if (itemsData[index][3] < 1) {
                      itemsData.removeAt(index);
                    }
                    setState(() {});
                  },
                ),
              ),
              sizedBoxWithHeight(16),
              Divider(
                color: AppColors.darkBackground,
              ),
              sizedBoxWithHeight(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.total,
                    style: AppTextStyles.text18w400Black,
                  ),
                  Text(
                    itemsData
                        .fold<num>(
                            0,
                            (previousValue, element) =>
                                previousValue + (element[2] * element[3]))
                        .formatCurrency()
                        .toString(),
                    style: AppTextStyles.text18w800Black,
                  )
                ],
              ),
              ...itemsData.map((e) => sizedBoxWithHeight(32)),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        child: const SwipeButton(),
      ),
    );
  }
}
